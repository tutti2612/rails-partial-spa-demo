<template>
  <div>
    <p v-if="notice" id="notice">{{ notice }}}}</p>

    <p>
      <strong>Title:</strong>
      {{ book.title }}
    </p>

    <router-link :to="{ name: 'edit', params: { id: book.id } }">
      Edit
    </router-link>
    |
    <router-link :to="{ name: 'index' }">Back</router-link>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      notice: "",
      book: {
        id: 0
      }
    };
  },
  created() {
    this.getBook();
  },
  methods: {
    async getBook() {
      try {
        const response = await axios.get(
          `/api/v1/books/${this.$route.params.id}`
        );
        console.log(response);
        this.book = response.data;
      } catch (error) {
        console.error(error);
      }
    }
  }
};
</script>
