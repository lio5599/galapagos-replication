; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r1/functions/libgcrypt/variants/c/1_ctz_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-context_cot-r1/functions/libgcrypt/variants/c/1_ctz_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %bit = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  %0 = load i64, ptr %in.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 64, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, ptr %in.addr, align 8
  %2 = load i64, ptr %in.addr, align 8
  %sub = sub i64 0, %2
  %and = and i64 %1, %sub
  store i64 %and, ptr %bit, align 8
  %3 = load i64, ptr %bit, align 8
  %and1 = and i64 %3, -6148914691236517206
  %cmp2 = icmp ne i64 %and1, 0
  %conv = zext i1 %cmp2 to i32
  store i32 %conv, ptr %r, align 4
  %4 = load i64, ptr %bit, align 8
  %and3 = and i64 %4, -3689348814741910324
  %cmp4 = icmp ne i64 %and3, 0
  %conv5 = zext i1 %cmp4 to i32
  %mul = mul nsw i32 2, %conv5
  %5 = load i32, ptr %r, align 4
  %add = add nsw i32 %5, %mul
  store i32 %add, ptr %r, align 4
  %6 = load i64, ptr %bit, align 8
  %and6 = and i64 %6, -1085102592571150096
  %cmp7 = icmp ne i64 %and6, 0
  %conv8 = zext i1 %cmp7 to i32
  %mul9 = mul nsw i32 4, %conv8
  %7 = load i32, ptr %r, align 4
  %add10 = add nsw i32 %7, %mul9
  store i32 %add10, ptr %r, align 4
  %8 = load i64, ptr %bit, align 8
  %and11 = and i64 %8, -71777214294589696
  %cmp12 = icmp ne i64 %and11, 0
  %conv13 = zext i1 %cmp12 to i32
  %mul14 = mul nsw i32 8, %conv13
  %9 = load i32, ptr %r, align 4
  %add15 = add nsw i32 %9, %mul14
  store i32 %add15, ptr %r, align 4
  %10 = load i64, ptr %bit, align 8
  %and16 = and i64 %10, -281470681808896
  %cmp17 = icmp ne i64 %and16, 0
  %conv18 = zext i1 %cmp17 to i32
  %mul19 = mul nsw i32 16, %conv18
  %11 = load i32, ptr %r, align 4
  %add20 = add nsw i32 %11, %mul19
  store i32 %add20, ptr %r, align 4
  %12 = load i64, ptr %bit, align 8
  %and21 = and i64 %12, -4294967296
  %cmp22 = icmp ne i64 %and21, 0
  %conv23 = zext i1 %cmp22 to i32
  %mul24 = mul nsw i32 32, %conv23
  %13 = load i32, ptr %r, align 4
  %add25 = add nsw i32 %13, %mul24
  store i32 %add25, ptr %r, align 4
  %14 = load i32, ptr %r, align 4
  store i32 %14, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %15 = load i32, ptr %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
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
