import UIKit

class CustomVerticalFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing
        let itemWidth = (availableWidth / 2).rounded(.down)
        itemSize = CGSize(width: itemWidth, height: 100) // Adjust the height as needed
        minimumLineSpacing = 10
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        var attributes = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in superAttributes {
            if itemAttributes.representedElementCategory == .cell {
                let itemRect = itemAttributes.frame
                let centerY = itemRect.midY
                
                // Adjust cell positions
                let finalCenterY = (centerY / 2).rounded(.down) * 2
                itemAttributes.center.y = finalCenterY
                
                attributes.append(itemAttributes)
            } else {
                attributes.append(itemAttributes)
            }
        }
        
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

