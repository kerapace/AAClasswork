
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

 function dogLinkCreator() {
  let dogLinks = [];
  for(const [name, url] of Object.entries(dogs)){
    let anchor = document.createElement('a');
    anchor.innerHTML = name;
    anchor.href = url;
    let newLi = document.createElement('li');
    newLi.appendChild(anchor);
    dogLinks.push(newLi);
  }
  return dogLinks;
}

function attachDogLinks() {
  let dogLinks = dogLinkCreator();
  let dogContainer = document.querySelector('ul.drop-down-dog-list')
  dogLinks.forEach(el => {
    dogContainer.appendChild(el);
  })
}

attachDogLinks();