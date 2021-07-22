/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   RPS                                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tsaiyan <tsaiyan@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/07/21 20:37:37 by tsaiyan           #+#    #+#             */
/*   Updated: 2021/07/21 21:58:59 by tsaiyan          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

import Foundation
import GameplayKit

enum GameState {
	case start, win, lose, draw
}

enum Sign: CaseIterable {
	case rock, paper, scissors
	
	static func random() -> Sign {
			return allCases.randomElement()!
	}

	func getResult(for opposite: Sign) -> GameState {
		switch (self, opposite) {
		case (.rock, .paper):
			return .lose
		case (.rock, .scissors):
			return .win
		case (.paper, .rock):
			return .win
		case (.paper, .scissors):
			return .lose
		case (.scissors, .rock):
			return .lose
		case (.scissors, .paper):
			return .win
		default:
			return .draw
		}
	}

	var emoji : String {
		switch self {
		case .paper:
			return "👋"
		case .rock:
			return "👊"
		case .scissors:
			return "✌️"
		}
	}
}
