import Vue from "vue";
import VueRouter from "vue-router";
import Index from "../pages/Index.vue";
import New from "../pages/New.vue";
import Show from "../pages/Show.vue";
import Edit from "../pages/Edit.vue";
import NotFound from "../pages/NotFound.vue";

Vue.use(VueRouter);

const routes = [
  { path: "/books", name: "index", component: Index },
  { path: "/books/new", name: "new", component: New },
  { path: "/books/:id(\\d+)", name: "show", component: Show },
  { path: "/books/:id(\\d+)/edit", name: "edit", component: Edit },
  { path: "*", name: "notFound", component: NotFound }
];

const router = new VueRouter({
  mode: "history",
  routes
});

export default router;
