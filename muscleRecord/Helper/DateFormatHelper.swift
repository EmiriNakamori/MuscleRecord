//
//  DateFormatHelper.swift
//  muscleRecord
//
//  Created by nakamori on 2023/02/26.
//

import Foundation

final class DateFormatHelper {
static let shared = DateFormatHelper()
    private let apiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmm"
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone.init(identifier: "Asia/Tokyo")
        return formatter
    }()

    func dateFromApiValue(from: String) -> Date? {
        apiDateFormatter.date(from: from)
    }
}
