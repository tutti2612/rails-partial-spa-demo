<template>
  <div>
    <h1>Editing Book</h1>

    <BookForm v-bind.sync="book" @submit="updateBook" />

    <router-link :to="{ name: 'show', params: { id: book.id } }">
      Show
    </router-link>
    |
    <router-link :to="{ name: 'index' }">Back</router-link>
  </div>
</template>

<script>
import axios from "axios";
import BookForm from "../components/BookForm.vue";
export default {
  components: { BookForm },
  data() {
    return {
      book: {
        id: 0
      }
    };
  },
  created() {
    this.getBook();
  },
  methods: {
    csrfToken() {
      return document.querySelector('meta[name="csrf-token"]').content;
    },
    async getBook() {
      const url = `/api/v1/books/${this.$route.params.id}`;
      try {
        const response = await axios.get(url);
        console.log(response);
        this.book = response.data;
      } catch (error) {
        console.error(error);
      }
    },
    async updateBook() {
      const url = `/api/v1/books/${this.$route.params.id}`;
      const data = { book: { title: this.book.title } };
      const config = { headers: { "X-CSRF-Token": this.csrfToken() } };
      try {
        const response = await axios.patch(url, data, config);
        console.log(response);
        this.$router.push({ name: "show", params: { id: this.book.id } });
      } catch (error) {
        console.error(error);
      }
    }
  }
};
</script>
