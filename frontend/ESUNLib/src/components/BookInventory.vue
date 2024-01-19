<template>
    <div>
        <h1>書本租借狀態</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Inventory ID</th>
                    <th>ISBN</th>
                    <th>BookName</th>
                    <th>Author</th>
                    <th>租借狀態</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in items" :key="item.inventory_Id">
                    <td>{{ item.inventory_Id }}</td>
                    <td>{{ item.isbn }}</td>
                    <td>{{ item.bookName }}</td>
                    <td>{{ item.author }}</td>
                    <td>{{ item.status }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
  
<script>
import axios from 'axios';

export default {
    data() {
        return {
            items: []
        };
    },
    created() {
        this.fetchData();
    },
    methods: {
        fetchData() {
            axios.get('http://localhost:8080/api/booksInv')
                .then(response => {
                    this.items = response.data;
                })
                .catch(error => {
                    console.error("There was an error fetching the data:", error);
                });
        }
    }
}
</script>
  