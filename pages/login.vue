<script setup lang="ts">
const supabase = useSupabaseClient();
const email = ref("");

const signInWithOtp = async () => {
  const { error } = await supabase.auth.signInWithOtp({
    email: email.value,
    options: {
      emailRedirectTo: "http://localhost/confirm"
    }
  });
  if (error) {
    console.log(error)
  }
}
</script>

<template>
  <div>
    <button @click="signInWithOtp">
      Sign in With Email
    </button>
    <input type="email" v-model="email" />
  </div>
</template>
