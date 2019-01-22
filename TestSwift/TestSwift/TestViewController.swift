//
//  TestViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/10/9.
//  Copyright © 2018 dx l. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let numsss = twoNums([2,1,3,5,6], 11)
        print(numsss ?? "")
        
        
        let waters = moreWater([1,8,6,2,5,4,8,3,7])
        print("waters:",waters)
        
        var tmp : ListNode?
        for i in 0...5 {
            let listNode = ListNode.init(i)
            listNode.next = tmp
            tmp = listNode
        }
        
        _ = removeNthFromEnd(tmp, 2)
        
        
        
    }
    

    // 两数之和
    func twoNums(_ nums:[Int], _ target: Int) -> [Int]? {
        for num in nums {
            let others = target - num
            // hash表的查找
            if nums.contains(others) {
                return [num,others]
            }
        }
        return nil
    }
    
    // 盛最多水的容器
    func moreWater(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        var area = 0
        while l < r {
            area = max(area, min(nums[l], nums[r]) * (r - l))
            if nums[l] < nums[r] {
                l += 1
            } else {
                r -= 1
            }
        }
      return area
    }
    
    
    // 删除倒数第n个节点
    // 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode.init(1)
        dummy.next = head
        var first : ListNode? = dummy
        var second = dummy
        
        for _ in 0..<n+1 {
            first = first?.next ?? nil
        }
        
        while first != nil {
            first = first?.next
            second = second.next!
        }
        second.next = second.next?.next
        
        return dummy.next
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
