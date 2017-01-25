//
//  PluralCategory.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/* Plural Rules
 http://cldr.unicode.org/index/cldr-spec/plural-rules
 */

/* Plural Rules Per Language
 http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html
 */

public enum PluralCategory: String {
    case zero
    case one // (singular)
    case two // (dual)
    case few // (paucal)
    case many // (also used for fractions if they have a separate class)
    case other // (required, general plural form, also used if the language only has a single form)
}
