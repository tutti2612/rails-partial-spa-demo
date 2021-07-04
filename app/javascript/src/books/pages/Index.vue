<template>
  <div>
    <p v-if="notice" id="notice">{{ notice }}</p>

    <h1>Books</h1>

    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th colspan="3"></th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="book in books" :key="book.id">
          <td>{{ book.title }}</td>
          <td>
            <router-link :to="{ name: 'show', params: { id: book.id } }">
              Show
            </router-link>
          </td>
          <td>
            <router-link :to="{ name: 'edit', params: { id: book.id } }">
              Edit
            </router-link>
          </td>
          <td>Destroy</td>
        </tr>
      </tbody>
    </table>

    <br />

    <router-link :to="{ name: 'new' }">New User</router-link>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      notice: "",
      books: []
    };
  },
  created() {
    this.getBooks();
  },
  methods: {
    async getBooks() {
      try {
        const response = await axios.get("/api/v1/books");
        console.log(response);
        this.books = response.data;
      } catch (error) {
        console.error(error);
      }
    }
  }
};
</script>
