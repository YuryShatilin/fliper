function flip(index) {

    changeState(gridGame.children[index]);
    // left
    var i = (index % 5 - 1) > 0 ? index - 1 : -1;
    if (i >= 0 ) {
        changeState(gridGame.children[i]);
    }

    // top
    i = index - 5;
    if (i >= 0 ) {
        changeState(gridGame.children[i]);
    }

    // right
    i = (index % 5 + 1) < 5 ? index + 1 : 25;
    if (i < 25) {
        changeState(gridGame.children[i]);
    }

    // bottom
    i = index + 5;
    if (i < 25) {
        changeState(gridGame.children[i]);
    }

}

function changeState(chip) {
    if (chip.state == 'RED') {
        chip.state = 'WHITE';
    } else {
        chip.state = 'RED';
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
    for (var i = 0 ; i < 25 ; i++) {
        gridGame.children[i] = 'RED';
    }
}
