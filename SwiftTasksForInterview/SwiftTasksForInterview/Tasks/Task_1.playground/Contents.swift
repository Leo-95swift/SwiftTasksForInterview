import UIKit

/*
 Задача 1

 Условие: Есть асинхронная функция которая что-то делает со строкой. Ее нужно вызвать для каждого элемента массива и вернуть его обновленный.

 Описание: Нужно показать умение работать с асинхронным кодом, потокобезопасно обращаться с массивом. Дополнительно могут как задача со звездочкой сделать порядок в выходном массиве таким же как и в исходным.
 */

final class AsyncWorker {
    func doTheJob(name: String, completion: @escaping (String) -> Void) {
        // ...что-то асинхронное
        completion(name)
    }
}

extension AsyncWorker {
    func doJobs(names: [String], completion: @escaping ([String]) -> Void) {
        
        let group = DispatchGroup()
        var result = Array(repeating: "", count: names.count)
        let locker = NSLock()
        
        for (index, name) in names.enumerated() {
            group.enter()
            doTheJob(name: name) { newName in
                locker.lock()
                result[index] = newName
                locker.unlock()
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            completion(result)
        }
    }
}

var names = ["name1", "name2", "name3", "name4"]
let asyncWorker = AsyncWorker()

asyncWorker.doJobs(names: names) { result in
    print(result)
}
