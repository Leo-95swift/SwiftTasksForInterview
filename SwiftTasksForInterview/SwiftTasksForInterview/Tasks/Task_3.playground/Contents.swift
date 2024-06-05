import UIKit

/*
Условие: Написать функцию которая тестирует, что после viewDidLoad отправится событие аналитики "hello world".

Описание: Выпиливать синглтон и вообще трогать класс аналитики запрещают.

Исходный код задачи:
*/

final class Analytics {
    // не будем использовать
    static let shared = Analytics()
    
    func send(event: String) {
        print(event)
    }
}

// вместо синглтона создаём protocol
// для настройки DI и для удобного тестинга
protocol AnalyticsService {
    func send(event: String)
}

extension Analytics: AnalyticsService {}

final class ViewController {
    private let analytics: AnalyticsService
    
    init(analytics: AnalyticsService) {
        self.analytics = analytics
    }
    
    func viewDidLoad() {
        analytics.send(event: "hello world")
    }
}

// MARK: - Testing

final class AnalyticsMock: AnalyticsService {
    var sendedEvent: String?
    
    func send(event: String) {
        self.sendedEvent = event
    }
}

func testViewDidLoadEvent() -> Bool {
    
    let targetEvent = "hello world"
    let mock = AnalyticsMock()
    let viewController = ViewController(analytics: mock)
    
    viewController.viewDidLoad()
    
    return mock.sendedEvent == targetEvent
}

testViewDidLoadEvent()

