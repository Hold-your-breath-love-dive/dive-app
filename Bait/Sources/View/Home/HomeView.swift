//
//  HomeView.swift
//  Bait
//
//  Created by Mercen on 2023/07/12.
//

import SwiftUI
import PhotosUI
import OpenTDS

struct HomeView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @State private var image = UIImage()
    @State private var result = "First you've to select an image"
    
    @StateObject var state = HomeState()
    
    var body: some View {
        
        TossScrollView("다이브") {
            HStack {
                VStack(alignment: .leading) {
                    Text("7월 12일 · 오늘의 바다 평균수온 22도")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    VStack(spacing: 15) {
                        Image("fish")
                            .padding([.top, .bottom], 10)
                        Text("해양생물을 찍고 찾아보세요!")
                            .font(.system(size: 20) .bold())
                        Text("해양생물을 카메라로 찍거나 갤러리에 있는 물고기 사진을 \n 가져와서 업로드 하시면 어떤 해양생물인지 알려드려요.")
                            .font(.system(size: 14))
                            .lineLimit(2)
                            .foregroundColor   (Color.gray)
                    }
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    
                    Button(action: {
                        self.isShowCamera = true
                    }) {
                        HStack {
                            Text("카메라로 찍기")
                                .foregroundColor(Color.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Image("RightArrow")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(result: self.$result, selectedImage: self.$image, sourceType: .photoLibrary)
                    }
                    
                    Button(action: {
                        self.isShowPhotoLibrary = true
                    }) {
                        HStack {
                            Text("갤러리에서 가져오기")
                                .foregroundColor(Color.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Image("RightArrow")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .sheet(isPresented: $isShowCamera) {
                        ImagePicker(result: self.$result, selectedImage: self.$image, sourceType: .camera)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .background(Color("Background"))
    }
}
