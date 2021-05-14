
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {

  let pTag = document.createElement("p");
  pTag.innerHTML = string;

  Array.from(htmlElement.children).forEach((el) => {
    htmlElement.removeChild(el);
  });
  htmlElement.appendChild(pTag);
};

htmlGenerator('Party Time.', partyHeader);
htmlGenerator('I <3 Vanilla DOM',partyHeader);

