## **패키지 & 파일생성**

- com.example.crud.controller.TodoController
- com.example.crud.repository.TodoappApplication
- com.example.crud.dto.TodoDto

## **TodoDto 설정**

- private Long id; private String title; private String content; private boolean completed; 넣고 생성자 Getter & Setter 만들어줌

## **TodoController 설정**

```
@Controller
@RequestMapping("/todos")
public class TodoController {
	private TodoRepository todoRepository;

    public TodoController(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }

    @GetMapping("")
    public String todos(Model model){
        //List<TodoDto> todoDtos = todoRepository.findAll();
        //model.addAttribute("todos", todoDtos);
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
## CrudApplication 설정
@SpringBootApplication
public class CrudApplication {

    public static void main(String[] args) {
        SpringApplication.run(TodoappApplication.class, args);
    }
    @Bean
    public CommandLineRunner init(TodoRepository todoRepository) {
        return args -> {
//            todoRepository.save(new TodoDto(null, "study", "JAVA" , false));
        };
    }
}

```

## **메인페이지 추가 & read all 로직 작성**

- crud\src\main\resources\templates\todos.html 만들고 실행

```
    <html lang="en" xmlns:th="http://www.thymeleaf.org">
	<div th:each="todo : ${todos}" >
        <H3 th:text="${todo.getTitle()}"></H3>
        <a th:href="@{/todos/{id}(id=${todo.getId()} )  }">detail</a>
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
```

- Repository

```
	public List<TodoDto> findAll(){
       return new ArrayList<TodoDto>(storage.values());
   }
```

## **create 로직 작성**

- Controller

```
    @GetMapping("/new")
    public String newTodos(){
        return "new";
    }

    @PostMapping()
    public String create(@RequestParam String title, @RequestParam String content, RedirectAttributes redirectAttributes, Model model){
        TodoDto todoDto = new TodoDto(null, title, content, false);
        TodoDto todo = todoRepository.save(todoDto);
        model.addAttribute("todo", todo);
        redirectAttributes.addFlashAttribute("message","할 일이 생성되었습니다.");
//        return "create";
        return "redirect:/todos";
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

- new.html

```

  <!-- <form action="/create"> -->
  <form action="/todos" method="post">
        <input type="text" name="title">
        <input type="submit"><br>
   </form>
```

## **read 1 로직 작성**

- Controller

```
	@GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model) {
        try {
            TodoDto todo = todoRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("todo not found!!!"));
            model.addAttribute("todo", todo);
            return "detail";
        } catch (IllegalArgumentException e){
            return "redirect:/todos";
        }
    }

```

- Repository

```
   public Optional<TodoDto> findById(Long id) {
       //return storage.get(id);
       return Optional.ofNullable(storage.get(id));
   }

```

- detail.html

```
	<h2 th:text="${todo.title}"></h2>
    <h4 th:text="${todo.content}"></h4>
    <h4 th:text="${todo.completed ? '완료' : '미완료' }"></h4>
    <hr>
    <a th:href="@{/todos/{id}/update(id=${todo.id})}">update</a>
    <a th:href="@{/todos/{id}/delete(id=${todo.id})}">delete</a>

```

## **delete 기능 구현**

- Controller

```
	@GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes, Model model){
        todoRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("message", "할일이 삭제되었습니다.");
        redirectAttributes.addFlashAttribute("status", "delete");
        return "redirect:/todos";
    }

```

- Repository

```
	public void deleteById(Long id) {
        storage.remove(id);
    }

```

## **update 기능 구현**

- Controller

```
	@GetMapping("/{id}/update")
    public String update(@PathVariable Long id, Model model){
        try {
            TodoDto todo = todoRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("todo not found!!!"));
            model.addAttribute("todo", todo);
            return "update";
        } catch (IllegalArgumentException e){
            return "redirect:/todos";
        }
    }

    @PostMapping("/{id}/update")
    public String update(@PathVariable Long id, @RequestParam String title, @RequestParam String content,
                         @RequestParam(defaultValue = "false") boolean completed,
                         RedirectAttributes redirectAttributes, Model model){
        try {
            TodoDto todo = todoRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("todo not found!!!"));
            todo.setTitle(title);
            todo.setContent(content);
            todo.setCompleted(completed);

            todoRepository.save(todo);
            model.addAttribute("todo", todo);
            redirectAttributes.addFlashAttribute("message", "할일이 수정되었습니다.");
            return "redirect:/todos/" + id;
        }
        catch (IllegalArgumentException e){
            redirectAttributes.addFlashAttribute("message", "없는 할일입니다.");
            return "redirect:/todos";
        }
    }

```

- update.html

```
	<form th:action="@{/todos/{id}/update(id=${todo.id})}"  method="post">
        <input type="text" name="title" th:value="${todo.title}">
        <input type="text" name="content" th:value="${todo.content}">
        <input type="hidden" name="id" th:value="${todo.id}">
        <input type="checkbox" name="completed" value="true" th:checked="${todo.completed}">
        <input type="submit"><br>
    </form>
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
    <div>
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

## 검색

- Controller

```
    @GetMapping("/search")
    public String search(@RequestParam String keyword,Model model){
        List<TodoDto> todoDtos = todoRepository.findByTitleContaining(keyword);
        model.addAttribute("todos", todoDtos);
        return "todos";
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
        List<TodoDto> todos = todoRepository.findBycompleted(false);
        model.addAttribute("todos", todos);
        return "todos";
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
            TodoDto todo = todoRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("todo not found!!!"));
            todo.setCompleted(!todo.isCompleted());
            todoRepository.save(todo);
            return "redirect:/todos/" + id;
        } catch (IllegalArgumentException e){
            return "redirect:/todos";
        }
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
