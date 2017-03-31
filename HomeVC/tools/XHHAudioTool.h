//
//
//    Howie  2017.
//
//
//
/*********************************************************
 
 ✞ 工具类作用:播放音频工具
 
 *********************************************************/


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface XHHAudioTool : NSObject

// 播放音乐 fileName:音乐文件
+ (AVAudioPlayer *)playMusicWithFileName:(NSString *)fileName;

// 暂停音乐 fileName:音乐文件
+ (void)pauseMusicWithFileName:(NSString *)fileName;

// 停止音乐 fileName:音乐文件
+ (void)stopMusicWithFileName:(NSString *)fileName;

// 播放音效 soundName:音效文件
+ (void)playSoundWithSoundName:(NSString *)soundName;

@end
