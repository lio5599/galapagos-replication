; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context-r1/functions/libgcrypt/variants/c/0_barrett_reduce_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context-r1/functions/libgcrypt/variants/c/0_barrett_reduce_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %x = alloca i32, align 4
  %product = alloca i32, align 4
  %t = alloca i16, align 2
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %mul = mul nsw i32 %1, 16384
  %2 = load i32, ptr %x, align 4
  %mul1 = mul nsw i32 %2, 4096
  %add = add nsw i32 %mul, %mul1
  %3 = load i32, ptr %x, align 4
  %mul2 = mul nsw i32 %3, 321
  %sub = sub nsw i32 %add, %mul2
  store i32 %sub, ptr %product, align 4
  %4 = load i32, ptr %product, align 4
  %add3 = add nsw i32 %4, 33554432
  %shr = ashr i32 %add3, 26
  %conv4 = trunc i32 %shr to i16
  store i16 %conv4, ptr %t, align 2
  %5 = load i16, ptr %t, align 2
  %conv5 = sext i16 %5 to i32
  %mul6 = mul nsw i32 %conv5, 3329
  %conv7 = trunc i32 %mul6 to i16
  store i16 %conv7, ptr %t, align 2
  %6 = load i16, ptr %a.addr, align 2
  %conv8 = sext i16 %6 to i32
  %7 = load i16, ptr %t, align 2
  %conv9 = sext i16 %7 to i32
  %sub10 = sub nsw i32 %conv8, %conv9
  %conv11 = trunc i32 %sub10 to i16
  ret i16 %conv11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
  ret i32 0
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
