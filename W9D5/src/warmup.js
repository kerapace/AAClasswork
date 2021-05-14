
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {

  let pTag = document.createElement("p");
  pTag.innerHTML = string;

  htmlElement.innerHTML = pTag;
};

htmlGenerator('Party Time.', partyHeader);
htmlGenerator('I <3 Vanilla DOM',partyHeader);

