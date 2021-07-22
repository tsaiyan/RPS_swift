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

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var robotButton: UIButton!
	@IBOutlet weak var statusLabel: UITextView!
	@IBOutlet weak var statusButton: UITextView!
	@IBOutlet weak var rockButton: UIButton!
	@IBOutlet weak var paperButton: UIButton!
	@IBOutlet weak var scissors: UIButton!
	@IBOutlet weak var resetButton: UIButton!

	// MARK: - viewDidLoad
	
	override func loadView() {
		super.loadView()
		
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		resetButton.isHidden = true
		// Do any additional setup after loading the view.
	}
	
	// MARK: - Methods

	func play(_ sign: Sign) {
		let computerSign = Sign.random()
		let result = sign.getResult(for :computerSign)

		robotButton.setTitle(computerSign.emoji, for: .normal)

		switch sign {
		case .rock:
			rockButton.isHidden = true
			paperButton.isHidden = true
			scissors.isHidden = true
		case .paper:
			rockButton.isHidden = true
			paperButton.isHidden = true
			scissors.isHidden = true
		case .scissors:
			rockButton.isHidden = true
			paperButton.isHidden = true
			scissors.isHidden = true
		}
		resetButton.isHidden = false

		switch result {
		case .win:
			statusLabel.text = "You win!"
			self.view.backgroundColor = UIColor.green
		case .lose:
		statusLabel.text = "You lose!"
		self.view.backgroundColor = UIColor.red
		case .draw:
		statusLabel.text = "draw!"
		self.view.backgroundColor = UIColor.blue
		case .start:
			reset()
		}
	}

	func reset() {
		statusLabel.text = "Rock, paper, scissors?"
		self.view.backgroundColor = UIColor.white
		rockButton.isHidden = false
		paperButton.isHidden = false
		scissors.isHidden = false
		resetButton.isHidden = false
	}

	// MARK: - IBActions

	@IBAction func rockButtonPressed(_ sender: Any) {
		play(.rock)
	}
	@IBAction func paperButtonPressed(_ sender: Any) {
		play(.paper)
	}
	@IBAction func scissorsButtonPressed(_ sender: Any) {
		play(.scissors)
	}
	@IBAction func resetButtonPressed(_ sender: Any) {
		reset()
		resetButton.isHidden = true
		robotButton.setTitle("🤖", for: .normal)
	}
}

