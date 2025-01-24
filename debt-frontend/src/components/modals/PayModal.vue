<template>
    <div class="modal-container" v-if="visible">
        <div class="modal">
            <button class="close-button" @click="$emit('close')">X</button>
            <div class="modal-content">
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        visible: Boolean
    }
}
</script>

<style scoped>
.modal-container {
    color: black;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}

.modal {
    background-color: white;
    border-radius: 15px;
    padding: 20px;
    width: 300px;
}

.close-button {
    position: absolute;
    color: white;
    top: 10px;
    right: 10px;
    cursor: pointer;
    background: none;
    border: none;
    font-size: 30px;
    font-weight: 900;
}

.modal-content {
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin: 0 0 10% 17%;
    padding: 2%;
}
</style>