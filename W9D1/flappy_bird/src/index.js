import FlappyBird from './game';
document.addEventListener('DOMContentLoaded', function() {
    const canvas = document.getElementById('bird-game');
    new FlappyBird(canvas);
    FlappyBird.restart();
    });
