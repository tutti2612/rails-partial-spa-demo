<template>
  <div>
    <div class="field">
      <!-- TODO: エラーメッセージ -->
      <label for="book_title">Title</label>
      <input
        type="text"
        id="book_title"
        :value="title"
        @input="$emit('update:title', $event.target.value)"
      />
    </div>

    <div class="actions">
      <button type="button" @click="$emit('submit')">Update Book</button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: ""
    }
  }
};
</script>
