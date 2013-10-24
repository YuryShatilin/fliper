var undoQue = [],
    redoQue = [];

function flip(index) {

    changeState(gridGame.children[index]);
    var pos = localIndex(index);

    var i = 0;

    if (pos.row !== 0) {
        i = globalIndex(pos.row - 1, pos.col);
        changeState(gridGame.children[i]);
    }

    if (pos.col !== 0) {
        i = globalIndex(pos.row, pos.col - 1);
        changeState(gridGame.children[i]);
    }

    if (pos.row + 1 < root.sizeGame) {
        i = globalIndex(pos.row + 1, pos.col);
        changeState(gridGame.children[i]);
    }

    if (pos.col + 1 < root.sizeGame) {
        i = globalIndex(pos.row, pos.col + 1);
        changeState(gridGame.children[i]);
    }

}

function globalIndex(i, j) {
    return i*root.sizeGame + j;
}

function localIndex(index) {
    return {
        col: index % root.sizeGame,
        row: Math.floor(index / root.sizeGame)
    };
}


function changeState(chip) {

    if (chip.state == 'RED') {
        
        chip.state = 'WHITE';
        chip.toWhite();

    } else {

        chip.state = 'RED';
        chip.toRed();
    }
}

function isWin() {
    for (var i = 0 ; i < 25 ; i++) {
//        console.log("asdfsdf");
        if (gridGame.children[i].state == 'RED') {
            return false;
        }
    }
    return true;
}

function restartGame() {
    for (var i = 0 ; i < root.sizeGame ; i++) {
        gridGame.children[i] = 'RED';
    }
}

function undo(ques) {

    if (!ques.undoQue.length) { return false; }

    var prevIndex = ques.undoQue.pop();
    flip(prevIndex);
    undoButton.color = ques.undoQue.length ? "#888" : "#ccc";

    ques.redoQue.push(prevIndex);
    redoButton.color = "#888";

}

function redo(ques) {
    if (!ques.redoQue.length) { return false; }

    var nextIndex = ques.redoQue.pop();
    flip(nextIndex);
    ques.undoQue.push(nextIndex);

    undoButton.color = "#888";
    redoButton.color = ques.redoQue.length ? "#888" : "#ccc";
}
