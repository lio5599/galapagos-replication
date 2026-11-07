; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %candidates = alloca [5 x i32], align 16
  %masks = alloca [5 x i32], align 16
  %complement = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  %fallback = alloca i32, align 4
  %select = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %candidates, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 71
  store i32 %sub1, ptr %arrayinit.element, align 4
  %arrayinit.element2 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, -4
  store i32 %sub3, ptr %arrayinit.element2, align 4
  %arrayinit.element4 = getelementptr inbounds i32, ptr %arrayinit.element2, i64 1
  store i32 62, ptr %arrayinit.element4, align 4
  %arrayinit.element5 = getelementptr inbounds i32, ptr %arrayinit.element4, i64 1
  store i32 63, ptr %arrayinit.element5, align 4
  %arrayinit.begin6 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 %4, 65
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 90, %5
  %or = or i32 %sub7, %sub8
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  store i32 %not, ptr %arrayinit.begin6, align 4
  %arrayinit.element9 = getelementptr inbounds i32, ptr %arrayinit.begin6, i64 1
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 97
  %7 = load i32, ptr %u, align 4
  %sub11 = sub i32 122, %7
  %or12 = or i32 %sub10, %sub11
  %shr13 = lshr i32 %or12, 8
  %not14 = xor i32 %shr13, -1
  store i32 %not14, ptr %arrayinit.element9, align 4
  %arrayinit.element15 = getelementptr inbounds i32, ptr %arrayinit.element9, i64 1
  %8 = load i32, ptr %u, align 4
  %sub16 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub17 = sub i32 57, %9
  %or18 = or i32 %sub16, %sub17
  %shr19 = lshr i32 %or18, 8
  %not20 = xor i32 %shr19, -1
  store i32 %not20, ptr %arrayinit.element15, align 4
  %arrayinit.element21 = getelementptr inbounds i32, ptr %arrayinit.element15, i64 1
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub22 = sub i32 0, %xor
  %shr23 = lshr i32 %sub22, 8
  %not24 = xor i32 %shr23, -1
  store i32 %not24, ptr %arrayinit.element21, align 4
  %arrayinit.element25 = getelementptr inbounds i32, ptr %arrayinit.element21, i64 1
  %11 = load i32, ptr %u, align 4
  %xor26 = xor i32 %11, 47
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %not29 = xor i32 %shr28, -1
  store i32 %not29, ptr %arrayinit.element25, align 4
  store i32 255, ptr %complement, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %candidates, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom30 = zext i32 %15 to i64
  %arrayidx31 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom30
  %16 = load i32, ptr %arrayidx31, align 4
  %and = and i32 %14, %16
  %not32 = xor i32 %and, -1
  %17 = load i32, ptr %complement, align 4
  %and33 = and i32 %17, %not32
  store i32 %and33, ptr %complement, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %complement, align 4
  %xor34 = xor i32 %19, 255
  store i32 %xor34, ptr %x, align 4
  %20 = load i32, ptr %u, align 4
  %xor35 = xor i32 %20, 65
  %sub36 = sub i32 0, %xor35
  %shr37 = lshr i32 %sub36, 8
  %and38 = and i32 %shr37, 255
  store i32 %and38, ptr %fallback, align 4
  %21 = load i32, ptr %x, align 4
  %cmp39 = icmp eq i32 %21, 0
  %conv = zext i1 %cmp39 to i32
  %sub40 = sub i32 0, %conv
  store i32 %sub40, ptr %select, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %select, align 4
  %not41 = xor i32 %23, -1
  %and42 = and i32 %22, %not41
  %24 = load i32, ptr %fallback, align 4
  %25 = load i32, ptr %select, align 4
  %and43 = and i32 %24, %25
  %or44 = or i32 %and42, %and43
  ret i32 %or44
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
