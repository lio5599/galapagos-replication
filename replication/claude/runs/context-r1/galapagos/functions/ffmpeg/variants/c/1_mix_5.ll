; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @mix(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mix(i32 noundef %c0, i32 noundef %c1) #0 {
entry:
  %c0.addr = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %r0 = alloca i32, align 4
  %r1 = alloca i32, align 4
  %red = alloca i32, align 4
  %green = alloca i32, align 4
  %blue = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, -1024
  %div = sdiv i32 %and, 1024
  store i32 %div, ptr %r0, align 4
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, -1024
  %div2 = sdiv i32 %and1, 1024
  store i32 %div2, ptr %r1, align 4
  %2 = load i32, ptr %r0, align 4
  %mul = mul nsw i32 2, %2
  %3 = load i32, ptr %r1, align 4
  %add = add nsw i32 %mul, %3
  store i32 %add, ptr %red, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %and3 = and i32 %4, 992
  %mul4 = mul nsw i32 2, %and3
  %5 = load i32, ptr %c1.addr, align 4
  %and5 = and i32 %5, 992
  %add6 = add nsw i32 %mul4, %and5
  %div7 = sdiv i32 %add6, 32
  store i32 %div7, ptr %green, align 4
  %6 = load i32, ptr %c0.addr, align 4
  %and8 = and i32 %6, 31
  %mul9 = mul nsw i32 2, %and8
  %7 = load i32, ptr %c1.addr, align 4
  %and10 = and i32 %7, 31
  %add11 = add nsw i32 %mul9, %and10
  store i32 %add11, ptr %blue, align 4
  %8 = load i32, ptr %red, align 4
  %div12 = sdiv i32 %8, 3
  %mul13 = mul nsw i32 %div12, 1024
  %9 = load i32, ptr %green, align 4
  %div14 = sdiv i32 %9, 3
  %mul15 = mul nsw i32 %div14, 32
  %add16 = add nsw i32 %mul13, %mul15
  %10 = load i32, ptr %blue, align 4
  %div17 = sdiv i32 %10, 3
  %add18 = add nsw i32 %add16, %div17
  ret i32 %add18
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
