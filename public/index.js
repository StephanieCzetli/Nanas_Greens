
const doAssignOrders = (data) =>
{
   globalOrders = data;
   return;
}

const doCreateOrdersWithIdsAndStatus = () =>
{
   ordersWithIdsAndStatus = globalOrders.map(({ order_Id: id, order_status: status }) => ({ id, status }));
}

let globalOrders;
let ordersWithIdsAndStatus;

// reference fetch on pg. 519
fetch('http://localhost:5000/orders')
// take the response(input) and parse the response body into JSON object (the baton)
   .then(res => res.json())
   // place json object in "data" and return it to the console 
   .then(doAssignOrders)
   .then(doCreateOrdersWithIdsAndStatus)
   .then(() =>
   {
   //render to DOM
      ordersWithIdsAndStatus.forEach(({ id, status }) =>
      {
         document.body.innerHTML += `<p>Order ID:${ id }</p>
            <p>Status: ${ status }</p>`
      });

   })

