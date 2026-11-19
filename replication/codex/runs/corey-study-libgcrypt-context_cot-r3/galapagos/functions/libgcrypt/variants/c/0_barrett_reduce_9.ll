; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/0_barrett_reduce_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r3/functions/libgcrypt/variants/c/0_barrett_reduce_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %t = alloca i16, align 2
  %x = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %x, align 4
  %sub = sub nsw i32 0, %2
  %mul = mul nsw i32 20159, %sub
  %add = add nsw i32 %mul, 33554431
  %shr = ashr i32 %add, 26
  %sub2 = sub nsw i32 0, %shr
  %conv3 = trunc i32 %sub2 to i16
  store i16 %conv3, ptr %t, align 2
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, ptr %x, align 4
  %mul4 = mul nsw i32 20159, %3
  %add5 = add nsw i32 %mul4, 33554432
  %shr6 = ashr i32 %add5, 26
  %conv7 = trunc i32 %shr6 to i16
  store i16 %conv7, ptr %t, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i16, ptr %t, align 2
  %conv8 = sext i16 %4 to i32
  %mul9 = mul nsw i32 %conv8, 3329
  %conv10 = trunc i32 %mul9 to i16
  store i16 %conv10, ptr %t, align 2
  %5 = load i16, ptr %a.addr, align 2
  %conv11 = sext i16 %5 to i32
  %6 = load i16, ptr %t, align 2
  %conv12 = sext i16 %6 to i32
  %sub13 = sub nsw i32 %conv11, %conv12
  %conv14 = trunc i32 %sub13 to i16
  ret i16 %conv14
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
