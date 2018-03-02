import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ['Rent, Play, Complete, Repeat'],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
