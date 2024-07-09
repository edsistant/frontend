<script setup lang="ts">
const session = useSupabaseSession();
</script>

<template>
  <div>
    <a v-if="session" href="/login">Logged in</a>
  </div>
</template>
