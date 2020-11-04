//
//  LevelController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 08/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class LevelController: UIViewController {
    
    private var levelView: LevelView!
    var level1Model: Level?
    var level2Model: Level?
    var level3Model: Level?
    var level4Model: Level?
    var level5Model: Level?
    var level6Model: Level?
    var level7Model: Level?
    var level8Model: Level?
    var level9Model: Level?
    var level10Model: Level?
    var currentLevel: Int?
    var currentStage: Int?
    
    var levelCurrentMedal: Int64?
    var regionSelected : String?
    var levels : [Level]? {
        didSet {
            level1Model = levels![0]
            level2Model = levels![1]
            level3Model = levels![2]
            level4Model = levels![3]
            level5Model = levels![4]
            level6Model = levels![5]
            level7Model = levels![6]
            level8Model = levels![7]
            level9Model = levels![8]
            level10Model = levels![9]
        }
    }
    var quizes : [Quiz]?
    var level: Level?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.setBackgroundColor()
        self.levelView = LevelView(frame: self.view.frame)
        //self.modalView = LevelModalView()
        self.view = self.levelView
        self.view.isUserInteractionEnabled = true

        tapFunction()
        tapButtonFunction()
        modalTap()
        setupCurrentLevel()
        settingLayout()
        settingNotificationCenter()

    }
    
    func settingNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData), name: NSNotification.Name(rawValue: "updateData"), object: .none)
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        let userInfo = notification.userInfo
        if (userInfo!["update"] != nil) == true {
            levelView.backgroundBlurView.removeFromSuperview()
            tapFunction()
            tapButtonFunction()
            modalTap()
            setupCurrentLevel()
            settingLayout()
            settingCurrentMedal()
            
            
        }
        
    }
    
    func settingCurrentMedal() {
        levelView.currentGununganLabel.text = "\(level?.stage?.currentMedal ?? 0)"
    }
    

    
    func setupCurrentLevel() {
        
        for i in 0...levels!.count-1 {
            if i == 0 {
        
                if level2Model!.isLocked == true {
                    self.currentLevel = 1
                    break
                }
            } else if i == 9 {
       
                if level9Model!.isLocked == false {
                    self.currentLevel = 9
                    break
                }
            } else if i>0 && i<9 {
              
                if levels![i-1].isLocked == false && levels![i+1].isLocked == true {
                    self.currentLevel = i+1
                    break
                }
            }
        }
    }
    
    func settingLayout() {
        
        levelView.currentGununganLabel.text = "\(levelCurrentMedal ?? 0)"
        
        levelView.backButtonTitle.text = "Tahap \(currentStage!)"
        
        //setting layout level 1
        if level1Model?.isLocked  == true && currentLevel != 1 {
            levelView.level1Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan1Image.image = UIImage(named: "gunungan0")
        } else if level1Model?.isLocked == false && currentLevel != 1 {
            levelView.level1Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            
            if level1Model?.totalMedal == 0 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan0")
            } else if level1Model?.totalMedal == 1 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan1")
            } else if level1Model?.totalMedal == 2 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan2")
            } else if level1Model?.totalMedal == 3 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan3")
            }
            
        } else if currentLevel == 1 {
            levelView.level1Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 1")
            
            if level1Model?.totalMedal == 0 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan0")
            } else if level1Model?.totalMedal == 1 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan1")
            } else if level1Model?.totalMedal == 2 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan2")
            } else if level1Model?.totalMedal == 3 {
                levelView.gunungan1Image.image = UIImage(named: "gunungan3")
            }
        }
        
        //setting level 2
        if level2Model?.isLocked  == true && currentLevel != 2 {
            levelView.level2Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan2Image.image = UIImage(named: "gunungan0")
        } else if level2Model?.isLocked == false && currentLevel != 2 {
            levelView.level2Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            
            if level2Model?.totalMedal == 0 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan0")
            } else if level2Model?.totalMedal == 1 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan1")
            } else if level2Model?.totalMedal == 2 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan2")
            } else if level2Model?.totalMedal == 3 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan3")
            }
            
        } else if currentLevel == 2 {
            levelView.level2Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 2")
            if level2Model?.totalMedal == 0 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan0")
            } else if level2Model?.totalMedal == 1 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan1")
            } else if level2Model?.totalMedal == 2 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan2")
            } else if level2Model?.totalMedal == 3 {
                levelView.gunungan2Image.image = UIImage(named: "gunungan3")
            }
            
            
        }
        
        //setting level 3
        if level3Model?.isLocked  == true && currentLevel != 3 {
            levelView.level3Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan3Image.image = UIImage(named: "gunungan0")
        } else if level3Model?.isLocked == false && currentLevel != 3 {
            levelView.level3Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            
            if level3Model?.totalMedal == 0 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan0")
            } else if level3Model?.totalMedal == 1 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan1")
            } else if level3Model?.totalMedal == 2 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan2")
            } else if level3Model?.totalMedal == 3 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan3")
            }
            
        } else if currentLevel == 3 {
            levelView.level3Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 3")
            if level3Model?.totalMedal == 0 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan0")
            } else if level3Model?.totalMedal == 1 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan1")
            } else if level3Model?.totalMedal == 2 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan2")
            } else if level3Model?.totalMedal == 3 {
                levelView.gunungan3Image.image = UIImage(named: "gunungan3")
            }
        }
        
        //setting level 4
        if level4Model?.isLocked  == true && currentLevel != 4 {
            levelView.level4Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan4Image.image = UIImage(named: "gunungan0")
        } else if level4Model?.isLocked == false && currentLevel != 4 {
            levelView.level4Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            
            if level4Model?.totalMedal == 0 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan0")
            } else if level4Model?.totalMedal == 1 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan1")
            } else if level4Model?.totalMedal == 2 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan2")
            } else if level4Model?.totalMedal == 3 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan3")
            }
        } else if currentLevel == 4 {
            levelView.level4Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 4")
            if level4Model?.totalMedal == 0 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan0")
            } else if level4Model?.totalMedal == 1 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan1")
            } else if level4Model?.totalMedal == 2 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan2")
            } else if level4Model?.totalMedal == 3 {
                levelView.gunungan4Image.image = UIImage(named: "gunungan3")
            }
        }
        
        //setting level 5
        if level5Model?.isLocked  == true && currentLevel != 5 {
            levelView.level5Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan5Image.image = UIImage(named: "gunungan0")
        } else if level5Model?.isLocked == false && currentLevel != 5 {
            levelView.level5Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            
            if level5Model?.totalMedal == 0 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan0")
            } else if level5Model?.totalMedal == 1 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan1")
            } else if level5Model?.totalMedal == 2 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan2")
            } else if level5Model?.totalMedal == 3 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan3")
            }
            
        } else if currentLevel == 5 {
            levelView.level5Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 5")
            if level5Model?.totalMedal == 0 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan0")
            } else if level5Model?.totalMedal == 1 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan1")
            } else if level5Model?.totalMedal == 2 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan2")
            } else if level5Model?.totalMedal == 3 {
                levelView.gunungan5Image.image = UIImage(named: "gunungan3")
            }
        }
        
        //setting layout level 6
        if level6Model?.isLocked  == true && currentLevel != 6 {
            levelView.level6Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan6Image.image = UIImage(named: "gunungan0")
        } else if level6Model?.isLocked == false && currentLevel != 6 {
            levelView.level6Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            
            if level6Model?.totalMedal == 0 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan0")
            } else if level6Model?.totalMedal == 1 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan1")
            } else if level6Model?.totalMedal == 2 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan2")
            } else if level6Model?.totalMedal == 3 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan3")
            }
            
        } else if currentLevel == 6 {
            levelView.level6Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 6")
            if level6Model?.totalMedal == 0 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan0")
            } else if level6Model?.totalMedal == 1 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan1")
            } else if level6Model?.totalMedal == 2 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan2")
            } else if level6Model?.totalMedal == 3 {
                levelView.gunungan6Image.image = UIImage(named: "gunungan3")
            }
        }

        //setting level 7
        if level7Model?.isLocked  == true && currentLevel != 7  {
            levelView.level7Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan7Image.image = UIImage(named: "gunungan0")
        } else if level7Model?.isLocked == false && currentLevel != 7 {
            levelView.level7Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            if level7Model?.totalMedal == 0 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan0")
            } else if level7Model?.totalMedal == 1 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan1")
            } else if level7Model?.totalMedal == 2 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan2")
            } else if level7Model?.totalMedal == 3 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan3")
            }
        } else if currentLevel == 7 {
            levelView.level7Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 7")
            if level7Model?.totalMedal == 0 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan0")
            } else if level7Model?.totalMedal == 1 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan1")
            } else if level7Model?.totalMedal == 2 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan2")
            } else if level7Model?.totalMedal == 3 {
                levelView.gunungan7Image.image = UIImage(named: "gunungan3")
            }
        }

        //setting level 8
        if level8Model?.isLocked  == true && currentLevel != 8 {
            levelView.level8Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan8Image.image = UIImage(named: "gunungan0")
        } else if level8Model?.isLocked == false && currentLevel != 8 {
            levelView.level8Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            if level8Model?.totalMedal == 0 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan0")
            } else if level8Model?.totalMedal == 1 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan1")
            } else if level8Model?.totalMedal == 2 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan2")
            } else if level8Model?.totalMedal == 3 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan3")
            }
        } else if currentLevel == 8 {
            levelView.level8Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 8")
            if level8Model?.totalMedal == 0 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan0")
            } else if level8Model?.totalMedal == 1 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan1")
            } else if level8Model?.totalMedal == 2 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan2")
            } else if level8Model?.totalMedal == 3 {
                levelView.gunungan8Image.image = UIImage(named: "gunungan3")
            }
        }

        //setting level 9
        if level9Model?.isLocked  == true && currentLevel != 9 {
            levelView.level9Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan9Image.image = UIImage(named: "gunungan0")
        } else if level9Model?.isLocked == false && currentLevel != 9 {
            levelView.level9Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            if level9Model?.totalMedal == 0 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan0")
            } else if level9Model?.totalMedal == 1 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan1")
            } else if level1Model?.totalMedal == 2 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan2")
            } else if level9Model?.totalMedal == 3 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan3")
            }
        } else if currentLevel == 9 {
            levelView.level9Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 9")
            if level9Model?.totalMedal == 0 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan0")
            } else if level9Model?.totalMedal == 1 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan1")
            } else if level1Model?.totalMedal == 2 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan2")
            } else if level9Model?.totalMedal == 3 {
                levelView.gunungan9Image.image = UIImage(named: "gunungan3")
            }
        }

        //setting level 10
        if level10Model?.isLocked  == true && currentLevel != 10 {
            levelView.level10Button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
            levelView.gunungan10Image.image = UIImage(named: "gunungan0")
        } else if level10Model?.isLocked == false && currentLevel != 10 {
            levelView.level10Button.setImage(UIImage(named: "levelButton Done"), for: .normal)
            if level10Model?.totalMedal == 0 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan0")
            } else if level10Model?.totalMedal == 1 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan1")
            } else if level10Model?.totalMedal == 2 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan2")
            } else if level10Model?.totalMedal == 3 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan3")
            }
        } else if currentLevel == 10 {
            levelView.level10Button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
            levelView.trackImage.image = UIImage(named: "Track 10")
            if level10Model?.totalMedal == 0 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan0")
            } else if level10Model?.totalMedal == 1 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan1")
            } else if level10Model?.totalMedal == 2 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan2")
            } else if level10Model?.totalMedal == 3 {
                levelView.gunungan10Image.image = UIImage(named: "gunungan3")
            }
        }
    }
    
    
    func tapFunction() {
        levelView.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        levelView.backButtonModal.addTarget(self, action: #selector(hideModal), for: .touchUpInside)
        levelView.startPlayButton.addTarget(self, action: #selector(goToQuizSection), for: .touchUpInside)
    }
    
    func tapButtonFunction() {
        
        if level1Model?.isLocked == false {
            levelView.level1Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level1Button.tag = 1
        }
        if level2Model?.isLocked == false {
            levelView.level2Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level2Button.tag = 2
        }

        if level3Model?.isLocked == false {
            levelView.level3Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level3Button.tag = 3
        }
        
        if level4Model?.isLocked == false {
            levelView.level4Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level4Button.tag = 4
        }
        
        if level5Model?.isLocked == false {
            levelView.level5Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level5Button.tag = 5
        }
        
        if level6Model?.isLocked == false {
            levelView.level6Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level6Button.tag = 6
        }
        
        if level7Model?.isLocked == false {
            levelView.level7Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level7Button.tag = 7
        }
        
        if level8Model?.isLocked == false {
            levelView.level8Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level8Button.tag = 8
        }
        
        if level9Model?.isLocked == false {
            levelView.level9Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level9Button.tag = 9
        }
        
        if level10Model?.isLocked == false {
            levelView.level10Button.addTarget(self, action: #selector(self.levelSelector), for: .touchUpInside)
            levelView.level10Button.tag = 10
        }
    }
    
    func modalTap() {
        let tapClose = UITapGestureRecognizer(target: self, action: #selector(hideModal))
        levelView.backgroundBlurView.addGestureRecognizer(tapClose)
    }
    

    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func levelSelector2(button: Int) {
        
    }
    
    @objc func levelSelector(sender: UIButton) {
        
        let i = sender.tag
        self.quizes = levels![i-1].quizes!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Quiz]
        self.level = levels?[i-1]
        levelView.levelCircleLogoModal.setTitle("\(i)", for: .normal)
        let totalmedal = levels![i-1].totalMedal
        let gununganImageName = "GununganStand\(totalmedal)"
        levelView.gununganImageModal.image = UIImage(named: gununganImageName)
        levelView.showModal()
    }
    
    @objc func goToQuizSection() {
        let quizScreen = QuizController()
        quizScreen.regionSelected = regionSelected
        quizScreen.quizes = quizes
        quizScreen.levels = levels
        quizScreen.level = level
        navigationController?.pushViewController(quizScreen, animated: true)
    }
    
    @objc func hideModal() {
        levelView.backgroundBlurView.removeFromSuperview()
    }
    
    @objc func tapCtnr() {
    }
}
