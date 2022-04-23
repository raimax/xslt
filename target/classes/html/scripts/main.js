let modal1;
let modal2;
let modal3;

window.onload = () => {
  console.log("script loaded");
  modal1 = document.getElementById("modal1");
  modal2 = document.getElementById("modal2");
  modal3 = document.getElementById("modal3");
  let continueReadingButtons = document.querySelectorAll("[data-id]");
  let articleCloseButtons = document.querySelectorAll("[data-close-id]");

  continueReadingButtons.forEach((button) => {
    console.log(getDataValue(button));
    if (getDataValue(button) == 1) {
      button.addEventListener("click", button1);
    } else if (getDataValue(button) == 2) {
      button.addEventListener("click", button2);
    } else if (getDataValue(button) == 3) {
      button.addEventListener("click", button3);
    }
  });

  articleCloseButtons.forEach((button) => {
    if (getDataValue(button) == 1) {
      button.addEventListener("click", closeButton1);
    } else if (getDataValue(button) == 2) {
      button.addEventListener("click", closeButton2);
    } else if (getDataValue(button) == 3) {
      button.addEventListener("click", closeButton3);
    }
  });
};

function button1() {
  modal1.classList.toggle("hide");
  modal2.classList.add("hide");
  modal3.classList.add("hide");
}

function button2() {
  modal2.classList.toggle("hide");
  modal1.classList.add("hide");
  modal3.classList.add("hide");
}

function button3() {
  modal3.classList.toggle("hide");
  modal1.classList.add("hide");
  modal2.classList.add("hide");
}

function closeButton1() {
  modal1.classList.toggle("hide");
  modal2.classList.add("hide");
  modal3.classList.add("hide");
}

function closeButton2() {
  modal2.classList.toggle("hide");
  modal1.classList.add("hide");
  modal3.classList.add("hide");
}

function closeButton3() {
  modal3.classList.toggle("hide");
  modal1.classList.add("hide");
  modal2.classList.add("hide");
}

function getDataValue(button) {
  return button.attributes[0].value;
}
