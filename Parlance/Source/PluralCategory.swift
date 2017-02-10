//
//  PluralCategory.swift
//  Parlance
//
//  Created by Brian Radebaugh on 1/24/17.
//  Copyright © 2017 Brian Radebaugh. All rights reserved.
//

/**
 These are the categories of pluralization that a language might have.
 
 - Important: When making a custom plural category for a specific language be sure to only include cases that are also present here (in `PluralCategory`).
 
 - Note: Not all languages use all six categories.
 - Note: For information on plural categories, see [Plural Rules](http://cldr.unicode.org/index/cldr-spec/plural-rules).
 - Note: For information on a specific language's plural rules, see [Plural Rules per Language](http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html) (Use *Cardinal* type).
 */
public enum PluralCategory: String {
    case zero
    case one // (singular)
    case two // (dual)
    case few // (paucal)
    case many // (also used for fractions if they have a separate class)
    case other // (required, general plural form, also used if the language only has a single form)
}
