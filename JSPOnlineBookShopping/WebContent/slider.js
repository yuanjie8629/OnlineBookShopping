let slideIndex = 1;
autoShowSlides();

function plusSlides(n) {
	showSlides(slideIndex += n);
}

function showSlides(n) {
	let i;
	let slides = document.getElementsByClassName("slide");
	if (n > slides.length) {
		slideIndex = 1;
	}
	if (n < 1) {
		slideIndex = slides.length;
	}
	for (i = 0; i < slides.length; i++) {
	  slides[i].style.display = "none";
	}
	slides[slideIndex-1].style.display = "block";
}

function autoShowSlides() {
	let i;
	let slides = document.getElementsByClassName("slide");
	for (i = 0; i < slides.length; i++) {
	  slides[i].style.display = "none";  
	}
	slideIndex++;
	if (slideIndex > slides.length) {
		slideIndex = 1;
	}
	slides[slideIndex-1].style.display = "block";
	setTimeout(autoShowSlides, 5000);
};