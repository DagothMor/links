Да там все не так сложно, как ты думаешь, ты спотыкался в основном на Алгебраических Типах Данных (почитай про них) и на одном из правил раста: либо одна мутабельная ссылка, либо много иммутабельных)
 
Алгебраические типы данных представлены энумами в расте. Result — каноничный пример, по факту Either
 
Либо одно, либо другое
===
почитать про borrow checker
===
Тебе опять же бы прочитать про АДТ, функторы, монады))
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

Ну полистал стрим) Не то что бы ты совсем всё понял, но ты очень близко) Вот этот рейлвей это очень специализированное описание монад. Само по себе понятие сильно шире, чем рельсы) (ред.)
 
Result это монада, которая имеет семантику "Либо то, что нужно, либо ошибка". Есть, например, ещё Option. Который сокрывает в себе "либо значение есть, либо нет". На самом деле это частный случай Result. А хаскеле есть стандартные монады типа Writer (которая пишет в лог), есть Reader, которая скрывает в себе контекст, который можно прочитать.
 
А expect это функция, которая просто берёт и грит "Я ожидаю здесь Ok(value) и ниибёт"
 
когда ты вызываешь expect (или unwrap) это всё равно что не проверять в сях результат на (-1) или NULL
 
Есть ошибка, нет, — пихуй, погнали дальше.
 
Мб тебе сразу маленько неясно будет, но связный список — это тоже монада)
 
Про мутабельные ссылки тоже НЕМНОГО неверно)
 
Тут как бы правильно, что расту глубоко всё равно, что сам объект у тебя мутабельный
 
Но если объект у нас может быть один
 
то ссылок на него может быть бесконечно много
 
Поэтому если ты куда-то отдаёшь мутабельную ссылку, это означает ровно следующее — ты не можешь из неё безопасно читать
 
Поэтому у тебя может одновременно существовать несколько мутабельных ссылок. А вот немутабельных — сколь угодно
 
Именно для этого мы разделяем эти понятия: передача куда-то ссылки, по которой можно изменить объект, и по которой нельзя
 
Норм портянку накидал

====


Атом в математической структуре

===
