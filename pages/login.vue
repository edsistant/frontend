<script setup lang="ts">
const supabase = useSupabaseClient();
const email = ref("");

const signInWithOtp = async () => {
  const { error } = await supabase.auth.signInWithOtp({
    email: email.value,
    options: {
      emailRedirectTo: "https://edsistant.com/confirm",
    },
  });
  if (error) {
    console.log(error);
  }
};
</script>

<template>
  <div>
    <button @click="signInWithOtp">Sign in With Email</button>
    <input v-model="email" type="email" />
  </div>
</template>
