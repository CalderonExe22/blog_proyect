const carousel = document.querySelector('.carousel');
const items = document.querySelectorAll('.carousel-item');
let currentItem = 0;

document.getElementById('next').addEventListener('click', () => {
    if (currentItem < items.length - 3) {
        currentItem++;
        updateCarousel();
    }
});

document.getElementById('prev').addEventListener('click', () => {
    if (currentItem > 0) {
        currentItem--;
        updateCarousel();
    }
});

function updateCarousel() {
    carousel.style.transform = `translateX(-${currentItem * 33.33}%)`;
}

updateCarousel();
