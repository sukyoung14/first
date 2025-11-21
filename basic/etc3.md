## **새프로젝트**

- 버젼 : 21
- 종속성 : spring web, Spring Boot Devtools, thymeleaf, Spring Data JPA, H2 Database 추가 확인
- build.gradle 파일 dependencies 에 스타터 추가
    1. spring data jpa
    2. h2 Database
- \springboot\todoapp\src\main\resources\application.properties 파일에

```
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console

spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=

spring.jpa.hibernate.ddl-auto=create
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

server.servlet.encoding.charset=UTF-8
server.servlet.encoding.enabled=true
server.servlet.encoding.force=true
```

## **패키지 & 파일생성**

- 위치 : com.example.프로젝트명
- controller.TodoController
- dto.TodoDto
- entity.TodoEntity
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
        return "todos";
    }
}
```

## **TodoRepository 설정**

```
public interface TodoRepository extends JpaRepository<TodoEntity, Long> {
}
```

## **TodoEntity 설정**

```
import jakarta.persistence.*;

@Entity
@Table(name="todos")
public class TodoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String content;
    private boolean completed;

    public TodoEntity() {}

    public TodoEntity(String title, String content, boolean completed) {
        this.title = title;
        this.content = content;
        this.completed = completed;
    }
}
```

- Getter & Setter 만들어줌, setId() 주석처리

## **TodoService 설정**

```
@Service
@Transactional
public class TodoService {
		private final TodoRepository todoRepository;
		public TodoService(TodoRepository todoRepository) {
				this.todoRepository = todoRepository;
		}
		private TodoDto toDto(TodoEntity todoEntity) {
        TodoDto dto = new TodoDto();
        dto.setId(todoEntity.getId());
        dto.setTitle(todoEntity.getTitle());
        dto.setContent(todoEntity.getContent());
        dto.setCompleted(todoEntity.isCompleted());
        return dto;
    }
    public List<TodoDto> getAllTodos() {
        return todoRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }
}
```

## **CrudApplication 설정**

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

## **Thymeleaf Layout Dialect 설치**

1. build.gradle 파일 dependencies 안에 // implementation 'GroupId:ArtifactId' 

  2.  implementation 'nz.net.ultraq.thymeleaf:thymeleaf-layout-dialect' 

  3. gradle 변경사항 동기화 ctrl + shift + o

- \src\main\resources\templates\layout\default.html 파일에

```
<html lang="en" xmlns:th="http://www.thymeleaf.org"  xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
		 <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" href="/todos">Home</a>
                    <a class="nav-link" href="/todos/active">active</a>
                    <a class="nav-link" href="/todos/completed">completed</a>
                    <a class="nav-link" href="/todos/new">new</a>

                    <form action="/todos/search" class="d-flex">
                        <input type="text" name="keyword" class="form-control">
                        <input type="submit" value="검색" class="btn btn-primary">
                    </form>
                    <a class="nav-link" href="/todos/delete-completed">완료삭제</a>

                </div>
            </div>
        </div>
     </nav>
     <div class="container">
	     <div th:if="${message}" th:classappend="${status == 'error' ? 'alert-danger' :
                                                  status == 'warning' ? 'alert-warning' : 'alert-primary' }"
             class="alert  alert-dismissible fade show"
             role="alert">
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

```
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{layout/default}">
	<div layout:fragment="content">
	</div>
</html>	
```
Bootstrap - Include via CDN : https://getbootstrap.com/
```

## **Exception**

- exception.ResourceNotFoundException

```
public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String message) {
        super(message);
    }
}
```

- exception.GlobalExceptionHandler

```
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(ResourceNotFoundException.class)
    public String handleResourceNotFound(ResourceNotFoundException e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", e.getMessage());
        redirectAttributes.addFlashAttribute("status", "error");
        return "redirect:/todos";
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public String handleIllegalArgumentException(IllegalArgumentException e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", e.getMessage());
        redirectAttributes.addFlashAttribute("status", "warning");
        return "redirect:/todos";
    }

    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", e.getMessage());
        return "redirect:/todos";
    }
}
```

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
        todoService.createTodo(todo);
        redirectAttributes.addFlashAttribute("message", "할 일이 생성되었습니다.");
        return "redirect:/todos";
    }

    @GetMapping("/{id}/update")
    public String edit(@PathVariable Long id, Model model){
        TodoDto todo = todoService.getTodoById(id);
        model.addAttribute("todo", todo);
        return "form";
    }

    @PostMapping("/{id}/update")
    public String update(@PathVariable Long id, @ModelAttribute TodoDto todo, RedirectAttributes redirectAttributes){
        todoService.updateTodoById(id, todo);
        redirectAttributes.addFlashAttribute("message", "할일이 수정되었습니다.");
        return "redirect:/todos/" + id;
    }
```

- Service

```
    public TodoDto getTodoById(Long id) {
        TodoEntity entity = findEntityById(id);
        return toDto(entity);
    }

    private TodoEntity findEntityById(Long id) {
        return  todoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("not found : " + id));
    }
    
    public TodoDto createTodo(TodoDto dto) {
        validateTitle(dto.getTitle());
        TodoEntity entity = new TodoEntity(dto.getTitle(), dto.getContent(), dto.isCompleted());
        return toDto(todoRepository.save(entity));
    }

    private void validateTitle(String title) {
        if (title == null || title.isEmpty()) {
            throw new IllegalArgumentException("제목은 필수입니다.");
        }
        if (title.length() > 50){
            throw new IllegalArgumentException("제목은 50자 미만입니다.");
        }
    }

    public TodoDto updateTodoById(Long id, TodoDto dto) {
        validateTitle(dto.getTitle());

        TodoEntity entity = findEntityById(id);
        entity.setTitle(dto.getTitle());
        entity.setContent(dto.getContent());
        entity.setCompleted(dto.isCompleted());

        return toDto(entity);
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
        TodoDto todo = todoService.getTodoById(id);
        model.addAttribute("todo", todo);
        return "detail";
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
        findEntityById(id);
        todoRepository.deleteById(id);
    }
```

## **검색**

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
        return todoRepository.findByTitleContaining(keyword).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }
```

- Repository

```
    List<TodoEntity> findByTitleContaining(String title);
```

- detail.html

```
    <form action="/search" class="d-flex">
        <input type="text" name="keyword" class="form-control">
        <input type="submit" value="검색" class="btn btn-primary">
    </form>
```

## active/**completed**

- Controller

```
    @GetMapping("/active")
    public String active(Model model){
        List<TodoDto> todos = todoService.getTodosByCompleted(false);
        model.addAttribute("todos", todos);
        model.addAttribute("totalCount", todoService.getTotalCount());
        model.addAttribute("completedCount", todoService.getCompletedCount());
        model.addAttribute("activeCount", todoService.getActiveCount());
        return "todos";
    }
    
    @GetMapping("/completed")
    public String completed(Model model){
        List<TodoDto> todos = todoService.getTodosByCompleted(true);
        model.addAttribute("todos", todos);
        model.addAttribute("totalCount", todoService.getTotalCount());
        model.addAttribute("completedCount", todoService.getCompletedCount());
        model.addAttribute("activeCount", todoService.getActiveCount());
        return "todos";
    }    
```

- Repository

```
    List<TodoEntity> findBycompleted(boolean completed);
```

- Service

```
    public List<TodoDto> getTodosByCompleted(boolean completed) {
        return todoRepository.findBycompleted(completed).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }
```

## **toggle**

- Controller

```
    @GetMapping("/{id}/toggle")
    public String toggle(@PathVariable Long id){
        TodoDto todo = todoService.getTodoById(id);
        todoService.toggleCompleted(id);
        return "redirect:/todos/" + id;
    }
```

- Service

```
    public TodoDto toggleCompleted(Long id) {
        TodoEntity entity = findEntityById(id);
        entity.setCompleted(!entity.isCompleted());
        return toDto(entity);
    }
```

- detail.html

```
  <a th:href="@{/todos/{id}/toggle(id=${todo.id})}" class="btn btn-primary">toggle</a>
```

## **alert**

- Controller

```
    RedirectAttributes redirectAttributes
    redirectAttributes.addFlashAttribute("message","할 일이 생성되었습니다.");
```

```
    <div th:if="${message}" th:classappend="${status == 'error' ? 'alert-danger' :
                                                  status == 'warning' ? 'alert-warning' : 'alert-primary' }"
         class="alert  alert-dismissible fade show"
         role="alert">
        <span th:text="${message}"></span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
```

## **deleteByCompleted**

- Controller

```
@GetMapping("/delete-completed")
    public String deleteCompleted(RedirectAttributes redirectAttributes){
        todoService.deleteCompletedTodos();
        redirectAttributes.addFlashAttribute("message", "완료된 할일이 삭제되었습니다.");
        return "redirect:/todos";
    }
```

- Repository

```
    void deleteByCompleted(boolean completed);
```

- Service

```
    public void deleteCompletedTodos() {
        todoRepository.deleteByCompleted(true);
    }
```

## **count**

- Controller

```
        model.addAttribute("totalCount", todoService.getTotalCount());
        model.addAttribute("completedCount", todoService.getCompletedCount());
        model.addAttribute("activeCount", todoService.getActiveCount());
```

- Service

```
public long getTotalCount(){
        return todoRepository.findAll().size();
    }
    public long getCompletedCount(){
        return todoRepository.findBycompleted(true).size();
    }
    public long getActiveCount(){
        return todoRepository.findBycompleted(false).size();
    }
```

- detail.html

```
    <div>
        <span>전체 : </span><span th:text = "${totalCount}"></span>
        <span>미완료 : </span><span th:text = "${activeCount}"></span>
        <span>완료 : </span><span th:text = "${completedCount}"></span>
    </div>
```