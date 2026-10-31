; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_2.c"
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
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %shr = ashr i32 %0, 10
  %mul = mul nsw i32 2, %shr
  %1 = load i32, ptr %c1.addr, align 4
  %shr1 = ashr i32 %1, 10
  %add = add nsw i32 %mul, %shr1
  %div = sdiv i32 %add, 3
  %mul2 = mul nsw i32 %div, 1024
  %2 = load i32, ptr %c0.addr, align 4
  %and = and i32 %2, 992
  %mul3 = mul nsw i32 2, %and
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %add5 = add nsw i32 %mul3, %and4
  %shr6 = ashr i32 %add5, 5
  %div7 = sdiv i32 %shr6, 3
  %mul8 = mul nsw i32 %div7, 32
  %add9 = add nsw i32 %mul2, %mul8
  %4 = load i32, ptr %c0.addr, align 4
  %and10 = and i32 %4, 31
  %mul11 = mul nsw i32 2, %and10
  %5 = load i32, ptr %c1.addr, align 4
  %and12 = and i32 %5, 31
  %add13 = add nsw i32 %mul11, %and12
  %div14 = sdiv i32 %add13, 3
  %add15 = add nsw i32 %add9, %div14
  ret i32 %add15
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
