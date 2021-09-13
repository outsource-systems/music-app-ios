//
//  SwiftUIView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/13.
//


import SwiftUI

struct MyDesign: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 39)
                    .clipped()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        HStack {
                            Image(systemName: "rectangle.stack.fill")
                            Text("My Magazines")
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color.primary), alignment: .center)
                        .font(Font.system(.footnote, design: .default).weight(.medium))
                        .foregroundColor(Color(.systemBackground))
                        HStack {
                            Image(systemName: "arrow.down.circle.fill")
                            Text("Downloaded")
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(.systemFill)), alignment: .center)
                        .font(Font.system(.footnote, design: .default).weight(.medium))
                        HStack {
                            Image(systemName: "newspaper.fill")
                            Text("Newspapers")
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(.systemFill)), alignment: .center)
                        .font(Font.system(.footnote, design: .default).weight(.medium))
                        HStack {
                            Image(systemName: "rectangle.grid.3x2.fill")
                            Text("Catalog")
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(.systemFill)), alignment: .center)
                        .font(Font.system(.footnote, design: .default).weight(.medium))
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 30)
                HStack {
                    Text("3 New Issues")
                    Spacer()
                    Image(systemName: "ellipsis.circle")
                        .font(Font.system(.title3, design: .default).weight(.medium))
                        .foregroundColor(Color.red)
                }
                .padding(.horizontal)
                .font(Font.system(.title3, design: .default).weight(.bold))
                VStack(spacing: 24) {
                    HStack {
                        VStack(spacing: 0) {
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                .frame(height: 225, alignment: .bottom)
                                .clipped()
                            Text("Vogue")
                                .font(Font.system(.footnote, design: .default).weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 16)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Image(systemName: "cloud.fill")
                                    .foregroundColor(Color(.tertiaryLabel))
                                Text("APRIL 2021")
                                    .foregroundColor(Color.secondary)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                            .padding(.top, 5)
                            .font(Font.system(.caption2, design: .default).weight(.semibold))
                        }
                        .frame(width: 160)
                        .clipped()
                        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.12), radius: 8, x: 0, y: 4)
                        Spacer()
                        VStack(spacing: 0) {
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                .frame(height: 225, alignment: .bottom)
                                .clipped()
                            Text("The Hollywood Reporter")
                                .font(Font.system(.footnote, design: .default).weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 16)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("SUGGESTED")
                                    .foregroundColor(Color.secondary)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                            .padding(.top, 5)
                            .font(Font.system(.caption2, design: .default).weight(.semibold))
                        }
                        .frame(width: 160)
                        .clipped()
                        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
                    }
                    .padding(.horizontal)
                    HStack {
                        VStack(spacing: 0) {
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                .frame(height: 225, alignment: .bottom)
                                .clipped()
                            Text("Vanity Fair")
                                .font(Font.system(.footnote, design: .default).weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 16)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("NEW")
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 1)
                                    .background(RoundedRectangle(cornerRadius: 4, style: .continuous)
                                        .foregroundColor(Color.red), alignment: .center)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                            .padding(.top, 3)
                            .font(Font.system(.caption2, design: .default).weight(.semibold))
                        }
                        .frame(width: 160)
                        .clipped()
                        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
                        Spacer()
                        VStack(spacing: 0) {
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                .frame(height: 225, alignment: .bottom)
                                .clipped()
                            Text("The Atlantic")
                                .font(Font.system(.footnote, design: .default).weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 16)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("NEW")
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 1)
                                    .background(RoundedRectangle(cornerRadius: 4, style: .continuous)
                                        .foregroundColor(Color.red), alignment: .center)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                            .padding(.top, 3)
                            .font(Font.system(.caption2, design: .default).weight(.semibold))
                        }
                        .frame(width: 160)
                        .clipped()
                        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
                    }
                    .padding(.horizontal)
                    HStack {
                        VStack(spacing: 0) {
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                .frame(height: 225, alignment: .bottom)
                                .clipped()
                            Text("Interior Design")
                                .font(Font.system(.footnote, design: .default).weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 16)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("NEW")
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 1)
                                    .background(RoundedRectangle(cornerRadius: 4, style: .continuous)
                                        .foregroundColor(Color.red), alignment: .center)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                            .padding(.top, 3)
                            .font(Font.system(.caption2, design: .default).weight(.semibold))
                        }
                        .frame(width: 160)
                        .clipped()
                        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
                        Spacer()
                        VStack(spacing: 0) {
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                .frame(height: 225, alignment: .bottom)
                                .clipped()
                            Text("Dwell")
                                .font(Font.system(.footnote, design: .default).weight(.semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.top, 16)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("NEW")
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 1)
                                    .background(RoundedRectangle(cornerRadius: 4, style: .continuous)
                                        .foregroundColor(Color.red), alignment: .center)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                            .padding(.top, 3)
                            .font(Font.system(.caption2, design: .default).weight(.semibold))
                        }
                        .frame(width: 160)
                        .clipped()
                        .shadow(color: Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255).opacity(0.1), radius: 8, x: 0, y: 4)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
            }
            Spacer()
                .frame(height: 108)
                .clipped()
        }
        .overlay(Image("myImage")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(0), alignment: .center)
    }
}

struct MyDesign_Previews: PreviewProvider {
    static var previews: some View {
        MyDesign()
    }
}
