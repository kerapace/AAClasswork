import FlappyBird from './game';
document.addEventListener('DOMContentLoaded', function() {
    const canvas = document.getElementById('bird-game');
    let fb = new FlappyBird(canvas);
    fb.restart();
    });
