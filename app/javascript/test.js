// ページ読み込み時、既存リストから行数を取得する
window.onload = function(){
    const idNum = document.getElementsByClassName('id');
    CalcPage(idNum.length);
}

// 行数が n 以上の場合はページを pageNum に分ける
function CalcPage(rowNum){
    // ページ数のしきい値を設定する
    let n = 3;
    // ページ数は切り上げる
    let pageNum = Math.ceil(rowNum / n);
    // 複数ページの場合の処理
    console.log(pageNum);
    MakeButton(pageNum);
}
// pageNum の数値分ボタンを作成する
function MakeButton(num){
    const ul = document.getElementById("page");
    console.log(ul);
    for(let i = 1; i <= num; i++){
        const li = document.createElement("li");
        li.innerText = i;
        li.classList.add("page-num");
        ul.appendChild(li);
    }
}

// TODOリスト作成する
const form = document.getElementById("form");
const input = document.getElementById("input");
const ul = document.getElementById("ul");

const todos = JSON.parse(localStorage.getItem("todos"));
if(todos){
  console.log('true');
}else{
    console.log('false');
}


if(todos > 0){
    todos.forEach(todo => {
        add(todo);
    })
}
form.addEventListener("submit", function (event){
    // デフォルトのイベントを発生させない
    event.preventDefault();
    console.log(input.value);
    add(todos);
});

// リストを追加する
function add(todo){
    // 空文字を禁止
    let todoText = input.value;

    if(todo > 0){
        todoText = todo.text;
    }

    if(todoText.length > 0){
        const li = document.createElement("li");
        li.innerText = todoText;
        li.classList.add("list-group-item");

        if(todo > 0 && todo.completed){
            li.classList.add("text-decoration-line-through");

        }
        // 右クリックで削除する
        li.addEventListener("contextmenu", function(event){
            event.preventDefault();
            li.remove();
            saveData();
        });
        // クリックで打消し線を追加
        li.addEventListener("click", function(){
            li.classList.toggle("text-decoration-line-through");
            saveData();
        });

        ul.appendChild(li);
        input.value = "";
        saveData();
    }
}

// ブラウザにデータを保存する
function saveData(){
    const lists = document.getElementsByClassName("list-group-item");
//    const lists = document.querySelectorAll(".list-group-item");
    let todos = [];
    Array.from(lists).forEach(list => {
        let todo = {
            text: list.innerText,
            completed: list.classList.contains("text-decoration-line-through")
        }
        todos.push(todo);
    });
    localStorage.setItem("todos", JSON.stringify(todos));
}