//daily expense tracker

function getFormattedTime(){
  const now=new Date().toLocaleTimeString('en-us',{
    month:'short',
    day:'numeric',
    hour:'2-digit',
    minute:'2-digit'
  })
  
  const date=now.split(',')[0].split(' ')
  const time=now.split(',')[1]
  const formattedTime=`${date[1]} ${date[0]},${time}`
  // console.log(formattedTime)
  // console.log(date)
  return formattedTime

}



document.querySelector('#ewallet-form').addEventListener('submit',function(e){
    e.preventDefault()

    console.log('form submitted')

    const type=document.querySelector('.add__type').value
    const desc=document.querySelector('.add__description').value
    const value=document.querySelector('.add__value').value

    //console.log(type,desc,value)

    if(desc.length>0 && value.length>0 && value>0){//trying to prevent blank entries

      addItems(type,desc,value)

      resetFrom()
    }else{
      alert("Invalid Entry.Please check the values and try again")
    }

   

})
showItems();
function showItems(){
  let items=getItemsFromLS();

  const collection=document.querySelector('.collection')
    

  for(let item of items){
    const newHTML=`
    <div class="item">
    <div class="item-description-time">
      <div class="item-description">
        <p>${item.desc}</p>
      </div>
      <div class="item-time">
        <p>${item.time}</p>
      </div>
    </div>
    <div class="item-amount ${item.type ==='+' ? 'income-amount' :
    'expense-amount'}">
      <p>${item.type}Rs.${sep(item.value)}</p>
    </div>
  </div>
    `

    collection.insertAdjacentHTML('afterbegin',newHTML)

  }

}

function addItems(type,desc,value){
  
  const time=getFormattedTime()

  const newHTML=`
    <div class="item">
    <div class="item-description-time">
      <div class="item-description">
        <p>${desc}</p>
      </div>
      <div class="item-time">
        <p>${time}</p>
      </div>
    </div>
    <div class="item-amount ${type ==='+' ? 'income-amount' :
    'expense-amount'}">
      <p>${type}Rs.${sep(value)}</p>
    </div>
  </div>
    `
    console.log(newHTML)

    const collection=document.querySelector('.collection')
    collection.insertAdjacentHTML('afterbegin',newHTML)

    //using local storage

    addItemToLS(type,desc,value,time);
    showTotalIncome();
    showTotalExpense();
    showTotalBalance();
};

function resetFrom(){

    document.querySelector('.add__type').value="+"
    document.querySelector('.add__description').value=" "
    document.querySelector('.add__value').value=" "


}

function getItemsFromLS(){

  let items=localStorage.getItem('items')
  if(items){

    items=JSON.parse(items);
  }else{
    items=[]//empty array/empty object
  }
  return items;
}

function addItemToLS(type,desc,value,time){

  
  let items=getItemsFromLS();
  items.push({//adding array data
    desc,type,value,time,  })
    //Reminder:when key and value is same then only one is required


  localStorage.setItem('items',JSON.stringify(items))



}

showTotalIncome()
function showTotalIncome(){

  let items=getItemsFromLS();
let totalIncome=0
  for(let item of items){
    if(item.type === '+'){
      totalIncome+=parseInt(item.value)//parseInt turns string->number

    }
  }
  console.log(totalIncome)
  document.querySelector('.income__amount p').innerText=`Rs.${sep(totalIncome)}`
}

showTotalExpense()
function showTotalExpense(){
  let items=getItemsFromLS();
let totalExpense=0
  for(let item of items){
    if(item.type === '-'){
      totalExpense+=parseInt(item.value)//parseInt turns string->number

    }
  }
  console.log(totalExpense)
  document.querySelector('.expense__amount p').innerText=`Rs.${sep(totalExpense)}`

}

showTotalBalance()
function showTotalBalance(){

  let items=getItemsFromLS();
  let balance=0
  for(let item of items){

    if(item.type==='+'){
      balance+=parseInt(item.value)
    }else{
      balance-=parseInt(item.value)
    }
  }
  document.querySelector('.balance__amount p').innerText=`Rs.${sep(balance)}`

  // if(balance>=0){
  //   document.querySelector('header').className='green'
  // }else{
  //   document.querySelector('header').className='red'
  // }
  document.querySelector('header').className=(balance>=0)?'green':'red'
}

//toLocaleString() makes the digits separated. Ex=>20,000
//instead of adding it everywhere, make a function

function sep(amount){
  amount=parseInt(amount)
  return amount.toLocaleString()
}