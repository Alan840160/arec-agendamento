<script setup>
defineProps({ recursos: { type: Array, required: true }, mensagem: { type: String, default: '' } })
const form = defineModel({ required: true })
const emit = defineEmits(['reservar'])
</script>

<template>
  <section class="card" aria-labelledby="nova-reserva">
    <h2 id="nova-reserva">Nova reserva</h2>
    <form @submit.prevent="emit('reservar')">
      <label>Recurso
        <select v-model="form.recurso" required>
          <option value="">Selecione</option>
          <option v-for="recurso in recursos" :key="recurso">{{ recurso }}</option>
        </select>
      </label>
      <label>Data <input v-model="form.data" type="date" required></label>
      <div class="times">
        <label>Início <input v-model="form.inicio" type="time" required></label>
        <label>Término <input v-model="form.fim" type="time" required></label>
      </div>
      <label>Número de pessoas <input v-model.number="form.pessoas" type="number" min="1" max="500" required></label>
      <button type="submit">Solicitar reserva</button>
      <p v-if="mensagem" class="message" role="status" aria-live="polite">{{ mensagem }}</p>
    </form>
  </section>
</template>
