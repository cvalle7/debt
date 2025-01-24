<template>
    <div v-if="isActive" class="modal-container">
        <div class="modal">
            <button class="close-modal" @click="$emit('close')">X</button>
            <div class="modal-content">
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        isActive: Boolean
    }
}
</script>

<style scoped>
.modal-container {
    position: fixed;
    color: black;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal{
    background-color: white;
    border-radius: 15px;
    padding: 20px;
    width: 300px;
}

.close-modal{
    position: absolute;
    color: white;
    top: 10px;
    right: 10px;
    border: none;
    background: none;
    cursor: pointer;
    font-size: 30px;
    font-weight: 900;
}

.modal-content{
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin: 0 0 10% 17%;
    padding: 2%;
}
</style>