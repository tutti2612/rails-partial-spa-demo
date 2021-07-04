import Vue from "vue";
import App from "../../src/books/App.vue";
import router from "../../src/books/router";

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    router,
    render: (h) => h(App)
  }).$mount("#app");
});
