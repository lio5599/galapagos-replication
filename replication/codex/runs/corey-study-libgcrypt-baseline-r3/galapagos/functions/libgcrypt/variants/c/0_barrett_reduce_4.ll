; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r3/functions/libgcrypt/variants/c/0_barrett_reduce_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-baseline-r3/functions/libgcrypt/variants/c/0_barrett_reduce_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %x = alloca i32, align 4
  %n = alloca i32, align 4
  %t = alloca i32, align 4
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
  %mul2 = mul nsw i32 %3, 256
  %sub = sub nsw i32 %add, %mul2
  %4 = load i32, ptr %x, align 4
  %mul3 = mul nsw i32 %4, 64
  %sub4 = sub nsw i32 %sub, %mul3
  %5 = load i32, ptr %x, align 4
  %sub5 = sub nsw i32 %sub4, %5
  store i32 %sub5, ptr %n, align 4
  %6 = load i32, ptr %n, align 4
  %add6 = add nsw i32 %6, 33554432
  %shr = ashr i32 %add6, 26
  store i32 %shr, ptr %t, align 4
  %7 = load i32, ptr %x, align 4
  %8 = load i32, ptr %t, align 4
  %mul7 = mul nsw i32 %8, 3329
  %sub8 = sub nsw i32 %7, %mul7
  %conv9 = trunc i32 %sub8 to i16
  ret i16 %conv9
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
