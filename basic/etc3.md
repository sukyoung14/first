## 새프로젝트

- 버젼 : 21
- 종속성 : spring web, Spring Boot Devtools, thymeleaf 추가 확인

## **패키지 & 파일생성**

- 위치 : com.example.프로젝트명
- controller.TodoController
- dto.TodoDto
- repository.TodoRepository
- service.TodoService

## **TodoDto 설정**

- private Long id; private String title; private String content; private boolean completed; 넣고 생성자 Getter & Setter 만들어줌
- public TodoDto() {}

## **TodoController 설정**

```
@Controller
@RequestMapping("/todos")
public class TodoController {
	private final TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @GetMapping("")
    public String todos(Model model){
        List<TodoDto> todoDtos = todoService.getAllTodos();
        model.addAttribute("todos", todoDtos);
        model.addAttribute("totalCount", todoService.getTotalCount());
        return "todos";
    }
}
```

## **TodoRepository 설정**

```
@Repository
public class TodoRepository {
    private final Map<Long, TodoDto> storage = new ConcurrentHashMap<>();
    private Long nextId = 1L;
}
```

## CrudApplication 설정

@SpringBootApplication

```
public class CrudApplication {

    public static void main(String[] args) {
        SpringApplication.run(TodoappApplication.class, args);
    }
    public CommandLineRunner init(TodoRepository todoRepository) {
        return args -> {
            todoRepository.save(new TodoDto(null, "study", "JAVA" , false));
        };
    }

}

```

## TodoService 설정\*\*

```

@Service
public class TodoService {
private final TodoRepository todoRepository;
public TodoService(TodoRepository todoRepository) {
this.todoRepository = todoRepository;
}

    public List<TodoDto> getAllTodos() {
        List<TodoDto> todoDtoList = new ArrayList<>();
        todoDtoList =  todoRepository.findAll();
        return todoDtoList;
    }
    public long getTotalCount(){
        return todoRepository.findAll().size();
    }

}

```

## **메인페이지 추가 & read all 로직 작성**

- crud\src\main\resources\templates\todos.html 만들고 실행

```

    <html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{layout/default}">

<div layout:fragment="content">
    <div>
        <span>전체 : </span><span th:text = "${totalCount}"></span>
        <span>미완료 : </span><span th:text = "${activeCount}"></span>
        <span>완료 : </span><span th:text = "${completedCount}"></span>
    </div>

    <table class="table table-striped">
        <thead>
        <th>ID</th>
        <th>Title</th>
        <th>Completed</th>
        <th>Detail</th>
        </thead>
        <tbody>
        <tr th:each="todo : ${todos}">
        <td th:text="${todo.id}"></td>
            <td th:text="${todo.getTitle()}"></td>
            <td>
                <span th:if="${todo.completed}" class="badge bg-success">완료</span>
                <span th:unless="${todo.completed}"  class="badge bg-warning">진행중</span>
            </td>
            <td>
                <a th:href="@{/todos/{id}(id=${todo.id})}" class="btn btn-sm btn-primary">detail</a>
            </td>
        </tr>
        </tbody>
    </table>

</div>
</html>
```

- Service

```
    public List<TodoDto> getAllTodos() {
        List<TodoDto> todoDtoList = new ArrayList<>();
        todoDtoList =  todoRepository.findAll();
        return todoDtoList;
    }
```

- Repository

```
	public List<TodoDto> findAll(){
       return new ArrayList<TodoDto>(storage.values());
   }
```

## Thymeleaf Layout Dialect 설치

- build.gradle 파일 dependencies 안에 // implementation 'GroupId:ArtifactId'
  implementation 'nz.net.ultraq.thymeleaf:thymeleaf-layout-dialect'
  넣고 gradle 변경사항 동기화 ctrl + shift + o
- \src\main\resources\templates\layout\default.html 파일에

```
<html lang="en" xmlns:th="http://www.thymeleaf.org"  xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     <div class="container">
        <div th:if="${message}" th:classappend="${status == 'delete' ? 'alert-danger': 'alert-warning'}" class="alert  alert-dismissible fade show"  role="alert">
            <span th:text="${message}"></span>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <div layout:fragment="content">
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
```

- 사용 html 파일에

````
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{layout/default}">
	<div layout:fragment="content">
	</div>
</html>	```
Bootstrap - Include via CDN : https://getbootstrap.com/
````

## **create & update 로직 작성**

- Controller

```
    @GetMapping("/new")
    public String newTodos(Model model){
        model.addAttribute("todo", new TodoDto());
        return "form";
    }

    @PostMapping()
    public String create(@ModelAttribute TodoDto todo, RedirectAttributes redirectAttributes, Model model){
        try{
            todoService.createTodo(todo);
            redirectAttributes.addFlashAttribute("message", "할 일이 생성되었습니다.");
            return "redirect:/todos";
        }catch(Exception e){
            redirectAttributes.addFlashAttribute("message", e.getMessage());
            return "redirect:/todos/new";
        }

    }

    @GetMapping("/{id}/update")
    public String edit(@PathVariable Long id, Model model){
        try {
            TodoDto todo = todoService.getTodoById(id);
            model.addAttribute("todo", todo);
            return "form";
        } catch (IllegalArgumentException e){
            return "redirect:/todos";
        }
    }

    @PostMapping("/{id}/update")
    public String update(@PathVariable Long id, @ModelAttribute TodoDto todo, RedirectAttributes redirectAttributes){
        try {
            todoService.updateTodoById(id, todo);
            redirectAttributes.addFlashAttribute("message", "할일이 수정되었습니다.");
            return "redirect:/todos/" + id;
        }
        catch (IllegalArgumentException e){
            if (e.getMessage().contains("제목")) {
                redirectAttributes.addFlashAttribute("message", e.getMessage());
                redirectAttributes.addFlashAttribute("status", "danger");
                return "redirect:/todos/" + id + "/update";
            } else {
                redirectAttributes.addFlashAttribute("message", "없는 할일입니다.");
                return "redirect:/todos";
            }
        }
    }
```

- Service

```
    public TodoDto createTodo(TodoDto todo) {
        validateTitle(todo.getTitle());
        return todoRepository.save(todo);
    }

    private void validateTitle(String title) {
        if (title == null || title.isEmpty()) {
            throw new IllegalArgumentException("제목은 필수입니다.");
        }
        if (title.length() > 50){
            throw new IllegalArgumentException("제목은 50자 미만입니다.");
        }
    }

    public TodoDto updateTodoById(Long id, TodoDto newTodo) {
        validateTitle(newTodo.getTitle());
        TodoDto originTodo = getTodoById(id);
        originTodo.setTitle(newTodo.getTitle());
        originTodo.setContent(newTodo.getContent());
        originTodo.setCompleted(newTodo.isCompleted());

        return todoRepository.save(originTodo);
    }
```

- Repository

```
    public TodoDto save(TodoDto todo){
        if (todo.getId() == null) {
        todo.setId(nextId++);
        }
        storage.put(todo.getId(), todo);
        return todo;
    }
```

- form.html

```
    <html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{layout/default}">
    <div layout:fragment="content">
        <h1 th:text="${todo.id == null ? 'new': 'update' }"></h1>
        <form th:action="${todo.id == null} ? '/todos': @{/todos/{id}/update(id=${todo.id})}"  method="post" th:object="${todo}">
            <label for="title" class="form-label">Title</label>
            <input id="title" class="form-control" th:field="*{title}">
            <label for="content" class="form-label">Content</label>
            <input id="content" class="form-control" th:field="*{content}">
            <input th:if="${todo.id != null}" type="checkbox" id="completed" class="form-check-input" th:field="*{completed}">
            <br>
            <input type="submit"  class="btn btn-primary">
        </form>
    </div>
    </html>
```

## **read 1 로직 작성**

- Controller

```
	@GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model) {
        try {
            TodoDto todo = todoService.getTodoById(id);
            model.addAttribute("todo", todo);
            return "detail";
        } catch (IllegalArgumentException e){
            return "redirect:/todos";
        }
    }

```

- Service

```
    public TodoDto getTodoById(Long id) {
        return  todoRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("todo not found!!!"));
    }
```

- Repository

```
   public Optional<TodoDto> findById(Long id) {
       return Optional.ofNullable(storage.get(id));
   }

```

- detail.html

```
	<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{layout/default}">
    <div layout:fragment="content">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title" th:text="${todo.title}"></h5>
                <p class="card-text" th:text="${todo.content}"></p>
                <p>
                    완료여부 :
                    <span th:if="${todo.completed}" class="badge bg-success">완료</span>
                    <span th:unless="${todo.completed}"  class="badge bg-warning">진행중</span>
                </p>
            </div>
        </div>
        <a th:href="@{/todos/{id}/toggle(id=${todo.id})}" class="btn btn-primary">toggle</a>
        <a th:href="@{/todos/{id}/update(id=${todo.id})}" class="btn btn-warning">update</a>
        <a th:href="@{/todos/{id}/delete(id=${todo.id})}" class="btn btn-danger">delete</a>
    </div>
    </html>
```

## **delete 기능 구현**

- Controller

```
	@GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes){
        todoService.deleteTodoById(id);
        redirectAttributes.addFlashAttribute("message", "할일이 삭제되었습니다.");
        redirectAttributes.addFlashAttribute("status", "delete");
        return "redirect:/todos";
    }

```

- Service

```
    public void deleteTodoById(Long id) {
        getTodoById(id);
        todoRepository.deleteById(id);
    }
```

- Repository

```
	public void deleteById(Long id) {
        storage.remove(id);
    }

```

## 검색

- Controller

```
    @GetMapping("/search")
    public String search(@RequestParam String keyword,Model model){
        List<TodoDto> todoDtos = todoService.searchTodos(keyword);
        model.addAttribute("todos", todoDtos);
        return "todos";
    }
```

- Service

```
    public List<TodoDto> searchTodos(String keyword) {
        return todoRepository.findByTitleContaining(keyword);
    }
```

- Repository

```
    public List<TodoDto> findByTitleContaining(String keyword) {
        return storage.values().stream()
                .filter((todo) -> todo.getTitle().contains(keyword))
                .toList();
    }
```

- detail.html

```
    <form action="/search" class="d-flex">
        <input type="text" name="keyword" class="form-control">
        <input type="submit" value="검색" class="btn btn-primary">
    </form>
```

## completed

- Controller

```
    @GetMapping("/active")
    public String active(Model model){
        List<TodoDto> todos = todoService.getTodosByCompleted(false);
        model.addAttribute("todos", todos);
        model.addAttribute("totalCount", todoService.getTotalCount());
        return "todos";
    }
```

- Service

```
    public List<TodoDto> getTodosByCompleted(boolean completed) {
        return todoRepository.findBycompleted(completed);
    }
```

- Repository

```
    public List<TodoDto> findBycompleted(boolean completed) {
        return storage.values().stream()
                .filter((todo) -> todo.isCompleted() == completed)
                .toList();
    }
```

## toggle

- Controller

```
    @GetMapping("/{id}/toggle")
    public String toggle(@PathVariable Long id, Model model){
        try {
            todoService.toggleCompleted(id);
            return "redirect:/todos/" + id;
        } catch (IllegalArgumentException e){
            return "redirect:/todos";
        }
    }
```

- Service

```
    public TodoDto toggleCompleted(Long id) {
        TodoDto todo = getTodoById(id);
        todo.setCompleted(!todo.isCompleted());
        return todoRepository.save(todo);
    }
```

- detail.html

```
       <a th:href="@{/todos/{id}/toggle(id=${todo.id})}" class="btn btn-primary">toggle</a>
```

## alert

- Controller

```
    RedirectAttributes redirectAttributes
    redirectAttributes.addFlashAttribute("message","할 일이 생성되었습니다.");
```

```
    <div th:if="${message}" th:classappend="${status == 'delete' ? 'alert-danger': 'alert-warning'}" class="alert  alert-dismissible fade show"  role="alert">
        <span th:text="${message}"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
```

## deleteCompleted

- Controller

```
@GetMapping("/delete-completed")
    public String deleteCompleted(RedirectAttributes redirectAttributes){
        todoService.deleteCompletedTodos();
        redirectAttributes.addFlashAttribute("message", "완료된 할일이 삭제되었습니다.");
        return "redirect:/todos";
    }
```

- Service

```
    public void deleteCompletedTodos() {
        todoRepository.deleteCompleted();
    }
```
