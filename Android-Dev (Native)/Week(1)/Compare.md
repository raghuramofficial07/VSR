<!-- GitHub Project Banner -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/501c98ee-809c-4376-b32d-6d38ae07c489" alt="Project Banner" width="100%">
</p>

# Kotlin Basics — With C++ Comparisons

## » Table of Contents
1. Variables  
2. Data Types  
3. Null Safety  
4. Functions  
5. Control Flow  
6. Collections  

---

## » 1. Variables

### Example: Declaring variables and printing values

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>using namespace std;<br><br>int main() {<br>    int a = 10;       // mutable<br>    const int b = 20; // immutable<br>    cout << "a: " << a << ", b: " << b << endl;<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun main() {<br>    var a = 10        // mutable<br>    val b = 20        // immutable<br>    println("a: $a, b: $b")<br>}<br>``` |

---

## » 2. Data Types

### Example: Using integers, doubles, and booleans

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>using namespace std;<br><br>int main() {<br>    int age = 21;<br>    double pi = 3.14;<br>    bool isStudent = true;<br>    cout << "Age: " << age << ", Pi: " << pi << ", Student: " << isStudent << endl;<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun main() {<br>    val age: Int = 21<br>    val pi: Double = 3.14<br>    val isStudent: Boolean = true<br>    println("Age: $age, Pi: $pi, Student: $isStudent")<br>}<br>``` |

---

## » 3. Null Safety

### Example: Handling nullable values

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>using namespace std;<br><br>int main() {<br>    int* ptr = nullptr;   // can hold null<br>    if(ptr == nullptr)<br>        cout << "Pointer is null" << endl;<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun main() {<br>    var name: String? = null<br>    if (name == null) {<br>        println("Name is null")<br>    }<br>}<br>``` |

---

## » 4. Functions

### Example: Sum of two numbers

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>using namespace std;<br><br>int sum(int a, int b) {<br>    return a + b;<br>}<br><br>int main() {<br>    cout << sum(3, 4) << endl;<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun sum(a: Int, b: Int): Int {<br>    return a + b<br>}<br><br>fun main() {<br>    println(sum(3, 4))<br>}<br>``` |

---

## » 5. Control Flow

### Example: If / Else

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>using namespace std;<br><br>int main() {<br>    int age = 18;<br>    if (age >= 18) {<br>        cout << "Adult" << endl;<br>    } else {<br>        cout << "Minor" << endl;<br>    }<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun main() {<br>    val age = 18<br>    if (age >= 18) {<br>        println("Adult")<br>    } else {<br>        println("Minor")<br>    }<br>}<br>``` |

---

### Example: Switch vs When

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>using namespace std;<br><br>int main() {<br>    int day = 3;<br>    switch(day) {<br>        case 1: cout << "Monday"; break;<br>        case 2: cout << "Tuesday"; break;<br>        case 3: cout << "Wednesday"; break;<br>        default: cout << "Other";<br>    }<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun main() {<br>    val day = 3<br>    when(day) {<br>        1 -> println("Monday")<br>        2 -> println("Tuesday")<br>        3 -> println("Wednesday")<br>        else -> println("Other")<br>    }<br>}<br>``` |

---

## » 6. Collections

### Example: List and Loop

| Language | Code |
|----------|------|
| **C++** | ```cpp<br>#include <iostream><br>#include <vector><br>using namespace std;<br><br>int main() {<br>    vector<int> nums = {1, 2, 3, 4};<br>    for(int n : nums) {<br>        cout << n << " ";<br>    }<br>    return 0;<br>}<br>``` |
| **Kotlin** | ```kotlin<br>fun main() {<br>    val nums = listOf(1, 2, 3, 4)<br>    for (n in nums) {<br>        print("$n ")<br>    }<br>}<br>``` |

---

## » Concept Highlights
- **Variables:** `var` (mutable) vs `val` (immutable) in Kotlin ≈ `int` vs `const int` in C++.  
- **Data Types:** Kotlin enforces strict typing; C++ allows implicit casts.  
- **Null Safety:** Kotlin enforces `?` type for nullable variables; C++ allows raw pointers.  
- **Functions:** Kotlin functions are more concise, no header needed.  
- **Control Flow:** Kotlin uses `when` instead of `switch`.  
- **Collections:** Kotlin collections are built-in (`listOf`, `setOf`), more high-level than `vector` in C++.  

---

## » Author Footer

**Created By:** Vemparala Sri Satya RaghuRam  
**License:** MIT  
**Platform:** Kotlin & C++ Basics  

<p align="left">
  <img src="https://img.shields.io/badge/%23BeyondCertifications-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23IndustryOriented-black?logo=tag&logoColor=white&labelColor=black&color=black">
  <img src="https://img.shields.io/badge/%23CodeWithRaghuRam-black?logo=tag&logoColor=white&labelColor=black&color=black">
</p>
