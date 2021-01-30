<template>
	<div class="container">
		<h1 class="float-cinter">Customer List</h1>
		<vuetable ref="vuetable"
		   api-url="getcustomerjson"
		   :fields="['id', 'code', 'name', 'phone']"
		   data-path=""
		   pagination-path=""
		></vuetable>
	</div>
</template>
<script>
    export default{


    };
</script>
