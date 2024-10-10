let panelTodo = document.getElementById("content-1")
let panelInProgress = document.getElementById("content-2")
let panelDone = document.getElementById("content-3")
const tasks = []

function getRadioValue(radioButtons) {
	for (var i = 0; i < radioButtons.length; i++) {
		if (radioButtons[i].checked) {
			var selected = radioButtons[i].value
			break
		}
	}
	return selected
}

function openForm(option, id) {
	let backdrop = document.querySelector(".dark-background")
	backdrop.style.display = "block"
	let formModal = document.querySelector(".add-form")
	formModal.style.display = "block"
	if (option == "add") {
		document.getElementById("form-type").innerHTML = "<input type='submit' class='btn' value='확인' onclick='addTask()'><input type='button' class='cancel' value='취소' onclick='closeForm()'>"
	} else if (option == "edit") {
		document.getElementById("form-type").innerHTML = "<input type='submit' class='btn' value='Confirm' onclick='updateTask(" + id + ")'><input type='button' class='cancel' value='Cancel' onclick='closeForm()'><input type='button' class='delete' value='Delete' onclick='deleteTask(" + id + ")'>"
	}
}

function closeForm() {
	let backdrop = document.querySelector(".dark-background")
	backdrop.style.display = "none"
	let formModal = document.querySelector(".add-form")
	formModal.style.display = "none"
	clearForm()
}

function clearForm() {
	document.getElementById("title").value = ""
	document.getElementById("description").value = ""
	document.getElementById("title").style.cssText = "border: none;"
	document.getElementById("instruction").style.cssText = "color: #353535;" + "font-weight: normal;"
	document.getElementById("todo").checked = true
}

function displayTasks() {
	panelTodo.innerHTML = ""
	panelInProgress.innerHTML = ""
	panelDone.innerHTML = ""
	for (var i = 0; i < tasks.length; i++) {
		var cardRow = "<div class='card' id='" + tasks[i].taskId + "' onclick='openCard(" + tasks[i].taskId + ")'><div class='card-text'>" + tasks[i].title + "</div></div>"

		if (tasks[i].status == "todo") {
			panelTodo.innerHTML += cardRow
		} else if (tasks[i].status == "inprogress") {
			panelInProgress.innerHTML += cardRow
		} else {
			panelDone.innerHTML += cardRow
		}
	}
}

function highlightRequiredField() {
	document.getElementById("title").style.cssText = "border: 1px solid red;"
	document.getElementById("title").focus()
	document.getElementById("instruction").style.cssText = "color: red;" + "font-weight: bold;"
}

function addTask() {
	var taskTitle = document.getElementById("title").value
	var taskDescription = document.getElementById("description").value

	if (taskTitle == "") {
		highlightRequiredField()
	} else {
		let taskStatus = getRadioValue(document.getElementsByName("status"))
		let i = tasks.length
		tasks[i] = {
			title: taskTitle,
			description: taskDescription,
			status: taskStatus,
			taskId: i
		}
		displayTasks()
		closeForm()
	}
}

function openCard(id) {
	document.getElementById("title").value = tasks[id].title
	document.getElementById("description").value = tasks[id].description
	document.getElementById(tasks[id].status).checked = true
	openForm("edit", id)
}

function updateTask(id) {
	if (document.getElementById("title").value == "") {
		highlightRequiredField()
	} else {
		tasks[id].title = document.getElementById("title").value
		tasks[id].description = document.getElementById("description").value
		tasks[id].status = getRadioValue(document.getElementsByName("status"))
		displayTasks()
		closeForm()
	}
}

function deleteTask(id) {
	tasks.splice(id, 1)
	for (var i = id; i < tasks.length; i++) {
		tasks[i].taskId = i
	}
	displayTasks()
	closeForm()
}

function confirmDeletion() {
	let confirmForm = document.querySelector("")
	confirmForm.style.display = "block"
}
