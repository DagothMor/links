Да там все не так сложно, как ты думаешь, ты спотыкался в основном на Алгебраических Типах Данных (почитай про них) и на одном из правил раста: либо одна мутабельная ссылка, либо много иммутабельных)
 
Алгебраические типы данных представлены энумами в расте. Result — каноничный пример, по факту Either
 
Либо одно, либо другое
===
почитать про borrow checker
===
Тебе опять же бы прочитать про АТД, функторы))
===
поковырять prelude
===
Nikolay Yasinskiy, [11 нояб. 2020 г., 14:19:48]:
Follpvosten, [11 нояб. 2020 г., 14:14:11]:
Oh, and I'd also add that since these are compile-time constraints, they come at no cost at runtime.

There's also a runtime equivalent - when you wrap a variable in a RefCell<T>, you can try to get a mutable reference from it at any point, but it's checked at runtime if that's valid (meaning it comes at a small runtime cost and will return an error if there is another mutable or immutable borrow)

Nikolay Yasinskiy, [11 нояб. 2020 г., 14:16:27]:
Thanks!

Follpvosten, [11 нояб. 2020 г., 14:16:59]:
https://play.rust-lang.org/?version=stable&mode=debug&edition=2018&gist=b2330cfafced1ecd07dfeb3fcba26308

For a simple example of using RefCell

Follpvosten, [11 нояб. 2020 г., 14:18:07 (11 нояб. 2020 г., 14:18:54)]:
Note that .borrow() and .borrow_mut() will panic on errors, so in the real world, you should use .try_borrow() and .try_borrow_mut() and handle the errors

Nikolay Yasinskiy, [11 нояб. 2020 г., 14:20:09]:
Follpvosten, [11 нояб. 2020 г., 11:46:18]:
If I understand the question correctly, it's because &Something and &mut Something are different types

And the compiler cannot know if what they're pointing to is mutable or not. These bindings are contracts that have specific guarantees, it's guaranteed that an &Something cannot be modified, but there can be multiple of them; and a &mut Something can be mutated, but there can only ever be one at the same time.

Nikolay Yasinskiy, [11 нояб. 2020 г., 14:23:25]:
I could go on about how Rc<T> plays into this and what their multi-threading friendly equivalents are, but I'll stop now unless you're interested
====
What is?

#[derive(Debug)]
#[derive(Debug, Clone, Copy)]

====
преобразованием при разыменовании
Deref coercion
====
Every function call is added to the Stack memory as a frame-block
====
Виртуальная память приложения относительно управления виртуальной памятью с уровня ОС
====

Атом в математической структуре

===

https://doc.rust-lang.org/reference/attributes.html

====
отличие append insert & push

===

// same meanings:
let a = &&  10;
let a = & & 10;

// same meanings:
let a = &&&&  mut 10;
let a = && && mut 10;
let a = & & & & mut 10;

===

String::from("Open")}).collect()

====
Как модули хъранятся в памяти
====

Command line arguments
https://doc.rust-lang.org/book/ch12-03-improving-error-handling-and-modularity.html?highlight=lib.rs#separation-of-concerns-for-binary-projects

====
