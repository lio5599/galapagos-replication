; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %reject = alloca [5 x i32], align 16
  %value = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %reject, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  store i32 %or, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  store i32 %or4, ptr %arrayinit.element, align 4
  %arrayinit.element5 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub7 = sub i32 57, %6
  %or8 = or i32 %sub6, %sub7
  store i32 %or8, ptr %arrayinit.element5, align 4
  %arrayinit.element9 = getelementptr inbounds i32, ptr %arrayinit.element5, i64 1
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub10 = sub i32 0, %xor
  store i32 %sub10, ptr %arrayinit.element9, align 4
  %arrayinit.element11 = getelementptr inbounds i32, ptr %arrayinit.element9, i64 1
  %8 = load i32, ptr %u, align 4
  %xor12 = xor i32 %8, 47
  %sub13 = sub i32 0, %xor12
  store i32 %sub13, ptr %arrayinit.element11, align 4
  %arrayinit.begin14 = getelementptr inbounds [5 x i32], ptr %value, i64 0, i64 0
  %9 = load i32, ptr %u, align 4
  %sub15 = sub i32 %9, 65
  store i32 %sub15, ptr %arrayinit.begin14, align 4
  %arrayinit.element16 = getelementptr inbounds i32, ptr %arrayinit.begin14, i64 1
  %10 = load i32, ptr %u, align 4
  %sub17 = sub i32 %10, 97
  %add = add i32 %sub17, 26
  store i32 %add, ptr %arrayinit.element16, align 4
  %arrayinit.element18 = getelementptr inbounds i32, ptr %arrayinit.element16, i64 1
  %11 = load i32, ptr %u, align 4
  %sub19 = sub i32 %11, 48
  %add20 = add i32 %sub19, 52
  store i32 %add20, ptr %arrayinit.element18, align 4
  %arrayinit.element21 = getelementptr inbounds i32, ptr %arrayinit.element18, i64 1
  store i32 62, ptr %arrayinit.element21, align 4
  %arrayinit.element22 = getelementptr inbounds i32, ptr %arrayinit.element21, i64 1
  store i32 63, ptr %arrayinit.element22, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %reject, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx, align 4
  %shr = lshr i32 %14, 8
  %and = and i32 %shr, 255
  %xor23 = xor i32 255, %and
  %15 = load i32, ptr %i, align 4
  %idxprom24 = zext i32 %15 to i64
  %arrayidx25 = getelementptr inbounds [5 x i32], ptr %value, i64 0, i64 %idxprom24
  %16 = load i32, ptr %arrayidx25, align 4
  %and26 = and i32 %xor23, %16
  %17 = load i32, ptr %x, align 4
  %or27 = or i32 %17, %and26
  store i32 %or27, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %sub28 = sub i32 0, %20
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %xor31 = xor i32 255, %and30
  %21 = load i32, ptr %u, align 4
  %xor32 = xor i32 %21, 65
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  %and36 = and i32 %xor31, %and35
  %or37 = or i32 %19, %and36
  ret i32 %or37
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
